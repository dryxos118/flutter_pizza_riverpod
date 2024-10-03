import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/service/fireauth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Function(bool) onItemSelected;
  final Function() onLoginPressed;
  const CustomAppBar(
      {super.key, required this.onItemSelected, required this.onLoginPressed});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.orange[600],
      elevation: 10.0,
      shadowColor: Colors.black,
      title: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'ForEach Pizza',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            onItemSelected(true);
          }),
      actions: [
        IconButton(
          onPressed: onLoginPressed,
          icon: const Icon(Icons.login),
          color:
              ref.watch(firebaseProvider) != null ? Colors.red : Colors.white,
        )
      ],
    );
  }
}
