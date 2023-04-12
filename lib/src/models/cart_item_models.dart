import 'package:food_app_getx/src/models/item_models.dart';

class CartItemModels{
  ItemModel items;
  int quantity;

  CartItemModels({
    required this.items,
    required this.quantity
  });

  double totalPrice() => items.price * quantity;
}