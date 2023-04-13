import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/models/cart_item_models.dart';
import 'package:food_app_getx/src/pages/cart/components/cart_tile.dart';
import 'package:food_app_getx/src/pages/common_widget/payment_dialog.dart';
import 'package:food_app_getx/src/services/utils.services.dart';
import 'package:food_app_getx/src/config/app_data.dart' as app_data;

class CartTab extends StatefulWidget {


  const CartTab({
    super.key
    });

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModels cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for( var item in app_data.cartItems){
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [

          //Listview product
          Expanded(
            child: ListView.builder(
              itemCount: app_data.cartItems.length,
              itemBuilder: (_, index){
                return CartTile(
                  cartItem: app_data.cartItems[index],
                  remove: removeItemFromCart,
                );
              }
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ]
            ),
            
            // Total - Confirm Order
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total: ',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    color: CustomColor.customSwatchColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),
                ), 
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.customSwatchColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        )
                      ),
                      onPressed: () async{
                        bool? result = await showOrderConfirmation();
                        if (result ?? false){
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context, 
                            builder: (_) {
                              return PaymentDialog(order: app_data.orders.first);
                            }
                          );
                        }
                      }, 
                      child: const Text(
                        'Confirm Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<bool?>showOrderConfirmation(){
    return showDialog<bool>(
      context: context, 
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          title: const Text('Confirm Order'),
          content: const Text('Do you want to complete order?'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(false);
              },
              child: const Text('No')
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              }, 
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              child: const Text('Save')
            )
          ],
        );
      }
    );
  }
}