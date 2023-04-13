import 'package:flutter/material.dart';
import 'package:food_app_getx/src/models/order_model.dart';
import 'package:food_app_getx/src/services/utils.services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Title
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Payment QR Code', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                    ),
                  ),
                ),
                //QR code
                QrImage(
                  data: 'asdsdsasdasaf',
                  version: QrVersions.auto,
                  size: 200,
                ),
          
                //Datetime order
                Text(
                  'Over Due Date: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(
                    fontSize: 12
                  ),
                ),
          
                //Total
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
          
                //Button copy QR
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    side: const BorderSide(
                      color: Colors.green,
                      width: 2
                    )
                  ),
                  onPressed: () {}, 
                  icon: const Icon(Icons.copy), 
                  label: const Text('Copy QR Code')
                )
              ],
            ),
          ),

           //Icon close
           Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            )
          )
        ],

       
      ),
    );
  }
}