import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';
import 'package:flutter_pizza_riverpod/service/pizza_provider.dart';
import 'package:flutter_pizza_riverpod/view/pizza/card_pizza.dart';
import 'package:flutter_pizza_riverpod/view/widget/base_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PizzaList extends ConsumerWidget {
  const PizzaList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pizzasList = ref.watch(pizzaProviderNotifier);
    return BaseScaffold(
        body: ref.watch(loadingProvider)
            ? const Center(child: CircularProgressIndicator())
            : pizzasList.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: pizzasList.map((Pizza pizza) {
                              return SizedBox(
                                height: 155,
                                child: CardPizza(pizza: pizza),
                              );
                            }).toList())
                      ],
                    ),
                  )
                : Center(
                    child: IconButton(
                        onPressed: () async {
                          await ref
                              .watch(pizzaProviderNotifier.notifier)
                              .initializeDb();
                        },
                        icon: const Icon(Icons.replay_outlined))));
  }
}
