import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';

class Orders {
  String? id;
  List<Pizza> pizzas;
  DateTime date;

  Orders({
    this.id,
    required this.pizzas,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pizzas': pizzas.map((e) => e.toMap()).toList(),
      'date': date.toIso8601String(),
    };
  }

  static Orders fromMap(DocumentSnapshot doc) {
    final data = doc;
    return Orders(
      id: doc.id,
      pizzas: (doc['pizzas'] as List<dynamic>)
          .map((p) => Pizza.fromMap(p))
          .toList(),
      date: DateTime.parse(doc['date']),
    );
  }
}
