import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingProvider = StateProvider<bool>((ref) => true);

final pizzaProviderNotifier = StateNotifierProvider<PizzaNotifier, List<Pizza>>(
    (ref) => PizzaNotifier(ref));

class PizzaNotifier extends StateNotifier<List<Pizza>> {
  Ref ref;

  PizzaNotifier(this.ref) : super([]);

  Future<void> loadPizzas() async {
    FirebaseFirestore.instance.collection('pizzas').get().then((snapshots) {
      //state et l'appelation du StateNotifier List<Pizza>
      state = List.from(
        snapshots.docs
            .map(
              (doc) => Pizza.fromFirestore(doc),
            )
            .toList(),
      );
      ref.read(loadingProvider.notifier).state = false;
    }, onError: (e) => print(e));
  }
}
