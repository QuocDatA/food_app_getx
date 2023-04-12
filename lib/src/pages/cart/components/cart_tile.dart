import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/models/cart_item_models.dart';
import 'package:food_app_getx/src/pages/common_widget/quantity_widget.dart';
import 'package:food_app_getx/src/services/utils.services.dart';

class CartTile extends StatefulWidget {
  final CartItemModels cartItem;
  final Function(CartItemModels) remove;

  const CartTile({super.key, required this.cartItem, required this.remove});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        //Image
        leading: Image.asset(
          widget.cartItem.items.imgUrl,
          width: 60,
          height: 60,
        ),

        //Title
        title: Text(
          widget.cartItem.items.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        //Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColor.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),

        //Quantity
        trailing: QuantityWidget(
            value: widget.cartItem.quantity,
            suffixText: widget.cartItem.items.unit,
            result: (quantity) {
              setState(() {
                widget.cartItem.quantity = quantity;

                if(quantity == 0) {
                  widget.remove(widget.cartItem);
                }
              });
            },
            isRemovable: true),
      ),
    );
  }
}
