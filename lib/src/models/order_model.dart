import 'package:food_app_getx/src/models/cart_item_models.dart';

class OrderModel {
  String id;
  DateTime createDateTime;
  DateTime overdueDateTime;
  List<CartItemModels> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createDateTime,
    required this.copyAndPaste,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.total
  });
}