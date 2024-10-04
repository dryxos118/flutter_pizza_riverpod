import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';
import 'package:flutter_pizza_riverpod/view/pizza/dialog_pizza.dart';

class CardPizza extends StatelessWidget {
  const CardPizza({super.key, required this.pizza});

  final Pizza pizza;

  void showPizzaDialog(BuildContext context, Pizza pizza) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PizzaDialog(
          pizza: pizza,
          onAddPizza: (Pizza pizza) {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Image.network(
              pizza.imageUrl,
              fit: BoxFit.contain,
              width: 100,
              height: 155,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        pizza.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      if (pizza.isVegan) ...{
                        const SizedBox(width: 8),
                        const Icon(Icons.eco, color: Colors.green),
                      }
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pizza.ingredients.join(' | '),
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'M: ${pizza.priceMedium.toStringAsFixed(2)} €',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'L: ${pizza.priceLarge.toStringAsFixed(2)} €',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showPizzaDialog(context, pizza);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF89515),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              bottomRight: Radius.circular(13),
                            ),
                          ),
                        ),
                        child: const Text(
                          '+ Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
