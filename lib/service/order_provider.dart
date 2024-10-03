import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pizza_riverpod/models/order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderStreamProvider =
    StreamNotifierProvider<OrderStreamNotifier, List<Orders>>(
        OrderStreamNotifier.new);

class OrderStreamNotifier extends StreamNotifier<List<Orders>> {
  @override
  Stream<List<Orders>> build() {
    return FirebaseFirestore.instance.collection('orders').snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => Orders.fromMap(doc)).toList());
  }

  Future<void> addOrder(Orders commande) async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .add(commande.toMap());
    } catch (e) {
      print('Erreur lors de l\'ajout de la commande: $e');
    }
  }

  Future<void> deleteOrder(String? id) async {
    try {
      await FirebaseFirestore.instance.collection('orders').doc(id).delete();
    } catch (e) {
      print('Erreur lors de l\'ajout de la commande: $e');
    }
  }
}
