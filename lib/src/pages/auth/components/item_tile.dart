import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/models/item_models.dart';
import 'package:food_app_getx/src/pages/products/product_screen.dart';
import 'package:food_app_getx/src/services/utils.services.dart';

class ItemTile extends StatelessWidget {

  final ItemModel item;
  final UtilsServices utilsServices = UtilsServices();

  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (c) {
                return ProductScreen(items: item);
              }
            )
          );
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Image
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(item.imgUrl),
                    )
                  ),
                  //Name
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ), 
        
                  //Price - Decription
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColor.customSwatchColor
                        ),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    ],
                  ), 
                ],
              ),
            ), 
          ),
        ),

        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColor.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(15)
                )
              ),

              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        )
      ],
    );
  }
}