import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pizza_riverpod/models/ingredients.dart';

class Pizza {
  String? id;
  String name;
  double price;
  bool isVegan;
  List<Ingredient> ingredients;

  Pizza({
    this.id,
    required this.name,
    required this.price,
    required this.isVegan,
    required this.ingredients,
  });

  // Méthode pour créer une Pizza depuis un document Firestore
  factory Pizza.fromFirestore(DocumentSnapshot doc) {
    final data = doc;

    // Récupération des ingrédients sous forme de List<Map> et conversion en List<Ingredient>
    var ingredientsData = data['ingredients'] as List<dynamic>?;
    List<Ingredient> ingredients = ingredientsData != null
        ? ingredientsData
            .map((ingredientData) => Ingredient.fromFirestore(ingredientData))
            .toList()
        : [];

    return Pizza(
      id: doc.id,
      name: data['name'] ?? 'Inconnu',
      price: (data['price'].toDouble() ?? 0.0),
      isVegan: data['isVegan'] ?? false,
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'isVegan': isVegan,
      'ingredients': ingredients.map((e) => e.toMap()).toList(),
    };
  }

  // Convert a map from Firebase to a PizzaDTO
  static Pizza fromMap(Map<String, dynamic> map) {
    return Pizza(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      isVegan: map['isVegan'],
      ingredients: (map['ingredients'] as List)
          .map((i) => Ingredient.fromMap(i))
          .toList(),
    );
  }
}
