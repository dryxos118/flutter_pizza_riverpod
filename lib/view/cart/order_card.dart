import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/models/order.dart';
import 'package:flutter_pizza_riverpod/service/order_provider.dart';
import 'package:flutter_pizza_riverpod/service/snackbar_service.dart';
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom d\'utilisateur: ${order.user}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Date de la commande: ${order.date.toUtc().toIso8601String()}',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pizzas commandées:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(order.pizzasOrder.map((x) => x.name).join("| ")),
            const Divider(),
            Row(
              children: [
                Text(
                  'Prix total: ${order.pizzasOrder.fold(0.0, (total, pizza) => total + pizza.price).toStringAsFixed(2)} €',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      ref
                          .watch(orderStreamProvider.notifier)
                          .deleteOrder(order.id);
                      SnackbarService(context).showSnackbar(
                          title: "Commande Supprimer", type: Type.succes);
                    },
                    child: const Text("Delete"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
