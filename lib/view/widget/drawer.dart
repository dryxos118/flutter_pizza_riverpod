import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final List<Map<String, dynamic>> roads = [
    {"id": 0, "title": "Home"},
    {"id": 2, "title": "panier"},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 125,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF25B7A5),
                ),
                child: Text(
                  'Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.local_pizza,
                color: Colors.white,
              ),
              title: const Text('Pizza', style: TextStyle(fontSize: 20, color: Colors.white)),
              onTap: () {
                context.go("/");
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: const Text('Panier', style: TextStyle(fontSize: 20, color: Colors.white)),
              onTap: () {
                context.go("/panier");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
