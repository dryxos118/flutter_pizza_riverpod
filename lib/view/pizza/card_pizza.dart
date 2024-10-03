import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';
import 'package:flutter_pizza_riverpod/view/pizza/dialog_pizza.dart';

class CardPizza extends StatelessWidget {
  const CardPizza({super.key, required this.pizza});

  final Pizza pizza;

  void showPizzaDialog(BuildContext context, Pizza pizza) {
    showDialog(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'asset/images/img.png',
              fit: BoxFit.cover,
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
                    'Medium | ${pizza.ingredients.map((e) => e.name).join('| ')}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${pizza.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
