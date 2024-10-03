import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/models/order.dart';
import 'package:flutter_pizza_riverpod/service/order_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderCard extends ConsumerWidget {
  final Orders order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.pizzas.first.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  order.date.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${order.pizzas.first.price}€',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () => ref
                      .read(orderStreamProvider.notifier)
                      .deleteOrder(order.id!),
                  icon: const Icon(Icons.remove_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
