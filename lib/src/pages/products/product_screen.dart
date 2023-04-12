import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/models/item_models.dart';
import 'package:food_app_getx/src/pages/common_widget/quantity_widget.dart';
import 'package:food_app_getx/src/services/utils.services.dart';

class ProductScreen extends StatefulWidget {

  final ItemModel items;

  const ProductScreen({
    super.key,
    required this.items
    });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final UtilsServices utilsServices = UtilsServices();
  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.items.imgUrl,
                  child: Image.asset(widget.items.imgUrl)
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2)
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      //Name - Quantity
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.items.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27
                              ),
                            ),
                          ),
                          QuantityWidget(
                            value: cartItemQuantity,
                            suffixText: widget.items.unit,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                              
                            },
                          )
                        ],
                      ),

                      // Price
                      Text(
                        utilsServices.priceToCurrency(widget.items.price),
                        style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: CustomColor.customSwatchColor
                            ),
                      ),

                      //Description
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.items.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),

                      //Confirm
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                            )
                          ),
                          onPressed: () {}, 
                          label: const Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        
                        ),
                      )

                    ],
                  ),
                  
                )
              )
            ],
          ),

          //Back press
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                icon: const Icon(Icons.arrow_back_ios)),
            ),
          )
        ],
      ),
    );
  }
}