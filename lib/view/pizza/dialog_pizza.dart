import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/models/order.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';
import 'package:flutter_pizza_riverpod/service/fireauth_provider.dart';
import 'package:flutter_pizza_riverpod/service/order_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PizzaDialog extends ConsumerWidget {
  final Pizza pizza;
  final Function(Pizza)? onAddPizza;

  const PizzaDialog({
    super.key,
    required this.pizza,
    this.onAddPizza,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(firebaseNotifier)!.currentUser?.email;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "asset/images/img.png",
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              pizza.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ingrédients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(pizza.ingredients.join(', ')),
            const SizedBox(height: 16),
            Text(
              '\$${pizza.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    onAddPizza!(pizza);
                    List<Pizza> test = [];
                    test.add(pizza);
                    ref.watch(orderStreamProvider.notifier).addOrder(Orders(
                        pizzas: test, date: DateTime.now(), user: userName));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ajouter Pizza'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Fermer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
