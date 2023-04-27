import 'package:food_app_getx/src/models/categories_model.dart';
import 'package:food_app_getx/src/models/item_models.dart';
import 'package:food_app_getx/src/pages/home/respository/home_respository.dart';
import 'package:food_app_getx/src/pages/home/result/home_result.dart';
import 'package:food_app_getx/src/services/utils.services.dart';
import 'package:get/get.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {

  final homeRespository = HomeRespository();
  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoriesModel> allCategories = [];
  List<ItemModel> get allProducts => currentCategory?.items ?? [];
  final utilsService = UtilsServices();
  CategoriesModel? currentCategory;

  bool get isLastPage {
    if(currentCategory!.items.length < itemsPerPage) return true;
    return currentCategory!.pagination * itemsPerPage > allProducts.length;
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if(!isProduct){
      isCategoryLoading = value;
    }else{
      isProductLoading = value;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getAllCategories();
  }

  void selectedCategory (CategoriesModel category) {
    currentCategory = category;
    update();

    getAllProducts();
  }

  void loadMoreProducts() {
    currentCategory!.pagination++;
    getAllProducts(canLoad: false);
  }
  
  Future<void> getAllCategories() async{
    setLoading(true);

    HomeResult<CategoriesModel> homeResult = await homeRespository.getAllCategories();

    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if(allCategories.isEmpty) return;

        selectedCategory(allCategories.first);
      }, 
      error: (message) {
        utilsService.showToast(message: message, isError: true);
      }
    );
  }

  Future<void> getAllProducts({bool canLoad = true}) async {

    if(canLoad){
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      "page": currentCategory!.pagination,
      "categoryId": currentCategory!.id,
      "itemsPerPage": itemsPerPage
    };

    HomeResult<ItemModel> homeResult = await homeRespository.getAllProducts(body);

    setLoading(false, isProduct: true);

    homeResult.when(
      success: (data) {
        
        currentCategory!.items.addAll(data);
        print(allProducts);
        print(currentCategory);
      }, 
      error: (message) {
        utilsService.showToast(message: message, isError: true);
      }
    );

  }
}