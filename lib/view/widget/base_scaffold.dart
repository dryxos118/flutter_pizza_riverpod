import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/service/user_provider.dart';
import 'package:flutter_pizza_riverpod/view/widget/custom_appbar.dart';
import 'package:flutter_pizza_riverpod/view/widget/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BaseScaffold extends ConsumerWidget {
  final Widget body;
  BaseScaffold({super.key, required this.body});
  final dynamic _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    void onLoginPressed(BuildContext context) {
      if (user != null) {
        print("logout");
        ref.read(userNotifier.notifier).logoutFromFirebase();
        context.go("/login");
      } else {
        print("login");
        context.go("/login");
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onItemSelected: (bool bool) =>
            {_scaffoldKey.currentState?.openDrawer()},
        onLoginPressed: () => {onLoginPressed(context)},
      ),
      drawer: Menu(),
      body: body,
    );
  }
}
