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
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children:
                      data.map((order) => OrderCard(order: order)).toList(),
                ),
              )
            : const Center(child: Text("Aucune commande")),
        error: (err, stack) => Container(),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
