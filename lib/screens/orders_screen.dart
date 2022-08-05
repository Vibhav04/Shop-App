import 'package:flutter/material.dart';
import 'package:myshop_app/providers/orders.dart' show Orders;
import 'package:myshop_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(
          order: orderData.orders[i],
        ),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
