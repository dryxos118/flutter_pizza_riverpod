import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  String? id;
  String? user;
  List<PizzaOrder> pizzasOrder;
  DateTime date;

  Orders({
    this.id,
    this.user,
    required this.pizzasOrder,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'pizzasOrder': pizzasOrder.map((e) => e.toMap()).toList(),
      'date': date.toIso8601String(),
    };
  }

  static Orders fromMap(DocumentSnapshot doc) {
    return Orders(
      id: doc.id,
      user: doc["user"],
      pizzasOrder: (doc['pizzasOrder'] as List<dynamic>)
          .map((p) => PizzaOrder.fromMap(p))
          .toList(),
      date: DateTime.parse(doc['date']),
    );
  }
}

class PizzaOrder {
  String? id;
  String name;
  String size;
  double price;
  int quantity;

  PizzaOrder(
      {this.id,
      required this.name,
      required this.size,
      required this.price,
      required this.quantity});

  // Méthode pour convertir un PizzaOrder en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'name': name,
      'size': size,
      'price': price,
      'quantity': quantity,
    };
  }

  // Méthode pour créer un PizzaOrder à partir d'une Map
  factory PizzaOrder.fromMap(Map<String, dynamic> map) {
    return PizzaOrder(
      id: map['id'] ?? '',
      name: map['name'],
      size: map['size'],
      price: map['price'],
      quantity: map['quantity'] ?? 0,
    );
  }
}
