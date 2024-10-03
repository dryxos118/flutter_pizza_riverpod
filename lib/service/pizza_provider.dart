import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pizza_riverpod/data/pizza.dart';
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

  Future<void> initializeDb() async {
    try {
      List<Pizza> pizzas = getPizza();

      for (Pizza pizza in pizzas) {
        await FirebaseFirestore.instance.collection('pizzas').add({
          "name": pizza.name,
          "name_lowercase": pizza.name.toLowerCase(),
          "imageUrl": pizza.imageUrl,
          "priceLarge": pizza.priceLarge,
          "priceMedium": pizza.priceMedium,
          "isVegan": pizza.isVegan,
          'ingredients': pizza.ingredients
        });

        print("Pizza ajoutée : ${pizza.name}");
        loadPizzas();
      }
    } catch (e) {
      print("Erreur lors de l'ajout des pizzas : $e");
    }
  }
}
