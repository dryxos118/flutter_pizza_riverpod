import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pizza_riverpod/models/order.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';
import 'package:flutter_pizza_riverpod/service/fireauth_provider.dart';
import 'package:flutter_pizza_riverpod/service/order_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PizzaDialog extends HookConsumerWidget {
  final Pizza pizza;
  final Function(Pizza)? onAddPizza;

  const PizzaDialog({
    super.key,
    required this.pizza,
    this.onAddPizza,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSize = useState('Moyenne');
    final quantity = useState(1);
    final Map<String, double> pizzaSizes = {
      'Moyenne': pizza.priceMedium,
      'Large': pizza.priceLarge,
    };

    double calculatePrice() {
      return pizzaSizes[selectedSize.value]! * quantity.value;
    }

    final userName = ref.watch(firebaseNotifier)!.currentUser?.email;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligner les éléments au centre
        children: [
          // Bouton pour fermer
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Aligner le texte et le bouton close
            children: [
              Text(
                'Name : ${pizza.name}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Choisir la taille de la pizza',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: pizzaSizes.keys.map((String size) {
              return RadioListTile<String>(
                value: size,
                groupValue: selectedSize.value, // Valeur sélectionnée
                onChanged: (String? newSize) {
                  if (newSize != null) {
                    selectedSize.value = newSize;
                  }
                },
                title: Text(
                  size,
                  style: const TextStyle(fontSize: 16),
                ),
                activeColor: Colors.orange, // Couleur de sélection
                controlAffinity:
                    ListTileControlAffinity.trailing, // Icône de radio à droite
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Quantité',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (quantity.value > 1) {
                    quantity.value--;
                  }
                },
              ),
              Text(
                quantity.value.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  quantity.value++;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Aligner le texte et le bouton close
            children: [
              Text(
                'Prix total: ${calculatePrice().toStringAsFixed(2)} €',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(orderStreamProvider.notifier).addOrder(
                        Orders(
                          pizzasOrder: [
                            PizzaOrder(
                              id: pizza.id,
                              name: pizza.name,
                              quantity: quantity.value,
                              size: selectedSize.value,
                              price: calculatePrice(),
                            )
                          ],
                          date: DateTime.now(),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ajouter au panier',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
