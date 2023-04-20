import 'package:food_app_getx/src/constants/storage_keys.dart';
import 'package:food_app_getx/src/models/user_models.dart';
import 'package:food_app_getx/src/pages/auth/repository/auth_repository.dart';
import 'package:food_app_getx/src/pages_routes/pages_routes.dart';
import 'package:food_app_getx/src/services/utils.services.dart';
import 'package:get/get.dart';

import '../result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final UtilsServices utilsServices = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  Future<void> validateToken() async {
    //Truy xuat token save local
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(success: (user) {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message) {
      signOut();
    });
  }

  Future<void> signOut() async {
    //Reset User
    user = UserModel();

    //Remove token local
    await utilsServices.removeLocalData(key: StorageKeys.token);

    //Go to Login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    //Save token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    //Go to base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;

      saveTokenAndProceedToBase();
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
