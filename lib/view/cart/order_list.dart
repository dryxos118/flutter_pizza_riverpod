import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/service/order_provider.dart';
import 'package:flutter_pizza_riverpod/view/cart/order_card.dart';
import 'package:flutter_pizza_riverpod/view/widget/base_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderList extends ConsumerWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsyncValue = ref.watch(orderStreamProvider);
    return BaseScaffold(
      body: orderAsyncValue.when(
        data: (data) => data.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Prix total: ${data.map((pizzasOrder) => pizzasOrder.pizzasOrder.fold(0.0, (total, pizza) => total + pizza.price)).fold(0.0, (total, order) => total + order)} €',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: data
                            .map((order) => Wrap(
                                  spacing: 5,
                                  children: [OrderCard(order: order)],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ))
            : const Center(child: Text("Aucune commande")),
        error: (err, stack) => Container(),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
