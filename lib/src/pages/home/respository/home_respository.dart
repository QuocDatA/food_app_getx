import 'package:food_app_getx/src/constants/endpoints.dart';
import 'package:food_app_getx/src/models/categories_model.dart';
import 'package:food_app_getx/src/pages/home/result/home_result.dart';
import 'package:food_app_getx/src/services/http_manager.dart';

import '../../../models/item_models.dart';

class HomeRespository {

  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoriesModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories, 
      method: HttpMethods.post
    );

    if(result['result'] != null) {
      //List
      List<CategoriesModel> data = 
      (List<Map<String, dynamic>>.from(result['result']))
      .map((e) => CategoriesModel.fromJson(e))
      .toList();
      return HomeResult<CategoriesModel>.success(data);
    }else {
      //Error
      return HomeResult.error('An unexpected error occurred while retrieving the items');
    }
  }

  Future<HomeResult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllProducts,
      method: HttpMethods.post,
      body: body,
    );

    if (result['result'] != null) {
      List<ItemModel> data = List<Map<String, dynamic>>.from(result['result'])
          .map(ItemModel.fromJson)
          .toList();

      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult.error(
          'An unexpected error occurred while retrieving the items');
    }
  }
}