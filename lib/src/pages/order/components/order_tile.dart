import 'package:flutter/material.dart';
import 'package:food_app_getx/src/models/cart_item_models.dart';
import 'package:food_app_getx/src/models/order_model.dart';
import 'package:food_app_getx/src/pages/order/components/order_status_widget.dart';
import 'package:food_app_getx/src/services/utils.services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orders;
  final UtilsServices utilsServices = UtilsServices();

  OrderTile({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),

        //Filter select
        child: ExpansionTile(
            initiallyExpanded: orders.status == 'pending_payment',
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order: ${orders.id}'),
                Text(
                  utilsServices.formatDateTime(orders.createDateTime),
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              IntrinsicHeight(
                child: Row(children: [
                  //List product order
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: orders.items.map((orderItem) {
                            return _OrderWidget(
                              utilsServices: utilsServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                        ),
                      )),

                  //Vertical Divider
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  //Status order
                  Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                          status: orders.status,
                          isOverdue: orders.overdueDateTime.isBefore(
                            DateTime.now(),
                          )))
                ]),
              ),
              //Total
              Text.rich(
                  TextSpan(style: const TextStyle(fontSize: 20), children: [
                const TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: utilsServices.priceToCurrency(orders.total))
              ])),

              //Button payment
              Visibility(
                visible: orders.status == 'pending_payment',
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/app_images/pix.png',
                    height: 20,
                  ),
                  label: const Text('QR CODE'),
                ),
              )
            ]),
      ),
    );
  }
}

class _OrderWidget extends StatelessWidget {
  const _OrderWidget(
      {super.key, required this.utilsServices, required this.orderItem});

  final UtilsServices utilsServices;
  final CartItemModels orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${orderItem.quantity} ${orderItem.items.unit}'),
          Expanded(child: Text(orderItem.items.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
