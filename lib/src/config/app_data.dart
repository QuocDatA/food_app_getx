import 'package:food_app_getx/src/models/cart_item_models.dart';
import 'package:food_app_getx/src/models/user_models.dart';

import '../models/item_models.dart';

ItemModel apple = ItemModel(
  description:
      'The best apple in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Apple',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Grape',
  price: 7.4,
  unit: 'kg',
  description:
      'The best grape in the region and which has the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Guava',
  price: 11.5,
  unit: 'kg',
  description:
      'The best guava in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'The best kiwi in the region and the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Mango',
  price: 2.5,
  unit: 'un',
  description:
      'The best mango in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Papaya',
  price: 8,
  unit: 'kg',
  description:
      'The best papaya in the region and with the best price of any grocery store. This item has essential vitamins for body strengthening, resulting in a healthy life.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = ['Fruits', 'Vegetables', 'Meats', 'Products'];

List<CartItemModels> cartItems = [
  CartItemModels(items: apple, quantity: 2),
  CartItemModels(items: mango, quantity: 1),
  CartItemModels(items: kiwi, quantity: 3),
];

UserModel user = UserModel(
  name: 'John', 
  email: 'john@gmail.com', 
  phone: '0800209200', 
  password: ''
);
