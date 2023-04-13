import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/app_data.dart' as app_data;
import 'package:food_app_getx/src/pages/order/components/order_tile.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => OrderTile(orders: app_data.orders[index]),
        separatorBuilder: (_, index) => const SizedBox(height: 10), 
        itemCount: app_data.orders.length
      ),
    );
  }
}