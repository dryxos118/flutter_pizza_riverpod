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
    void onLoginPressed(BuildContext context) {
      if (ref.watch(userProvider) != null) {
        ref.watch(userNotifier.notifier).logoutFromFirebase();
        context.go("/login");
      } else {
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
