import 'package:flutter/material.dart';
import 'package:myshop_app/providers/cart.dart' show Cart;
import 'package:myshop_app/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '₹${cart.totalAmount}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6!.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: const Text(
                      'ORDER NOW',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((ctx, i) => CartItem(
                    id: cart.items.values.toList()[i].id,
                    productId: cart.items.keys.toList()[i],
                    price: cart.items.values.toList()[i].price,
                    quantity: cart.items.values.toList()[i].quantity,
                    title: cart.items.values.toList()[i].title,
                  )),
              itemCount: cart.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
