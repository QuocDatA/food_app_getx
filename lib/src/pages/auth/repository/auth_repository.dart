import 'package:food_app_getx/src/constants/endpoints.dart';
import 'package:food_app_getx/src/models/user_models.dart';
import 'package:food_app_getx/src/pages/auth/result/auth_result.dart';
import 'package:food_app_getx/src/pages/auth/repository/auth_errors.dart' as authErrors;
import 'package:food_app_getx/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.validateToken, 
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token
      }
    );

    if(result['result'] != null){

      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    }else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin, 
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password
      }
    );

    if(result['result'] != null){

      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    }else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  
  }
}