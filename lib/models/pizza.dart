import 'package:cloud_firestore/cloud_firestore.dart';

class Pizza {
  String? id;
  String name;
  List<String> ingredients;
  String imageUrl;
  double priceMedium;
  double priceLarge;
  bool isVegan = false;

  Pizza(
      {this.id,
      required this.name,
      required this.ingredients,
      required this.imageUrl,
      required this.priceMedium,
      required this.priceLarge,
      required this.isVegan});

  // Méthode pour créer une Pizza depuis un document Firestore
  factory Pizza.fromFirestore(DocumentSnapshot doc) {
    final data = doc;

    List<dynamic> ingredientsDoc = data["ingredients"];

    return Pizza(
      id: doc.id,
      name: data['name'] ?? 'Inconnu',
      imageUrl: data['imageUrl'],
      priceMedium: (data['priceMedium'].toDouble() ?? 0.0),
      priceLarge: (data["priceLarge"].toDouble() ?? 0.0),
      isVegan: data['isVegan'] ?? false,
      ingredients: ingredientsDoc.map((item) => item.toString()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'priceMedium': priceMedium,
      'priceLarge': priceLarge,
      'imageUrl': imageUrl,
      'isVegan': isVegan,
      'ingredients': ingredients,
    };
  }

  // Convert a map from Firebase to a PizzaDTO
  static Pizza fromMap(Map<String, dynamic> map) {
    List<dynamic> ingredientsDoc = map["ingredients"];

    return Pizza(
        id: map['id'],
        name: map['name'],
        imageUrl: map['imageUrl'],
        priceMedium: map['priceMedium'],
        priceLarge: map['priceLarge'],
        isVegan: map['isVegan'],
        ingredients: ingredientsDoc.map((item) => item.toString()).toList());
  }
}
