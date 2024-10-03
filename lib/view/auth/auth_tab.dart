import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/view/auth/login.dart';
import 'package:flutter_pizza_riverpod/view/auth/register.dart';
import 'package:flutter_pizza_riverpod/view/widget/base_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthTab extends ConsumerWidget {
  const AuthTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
        body: DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
            ],
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
          ),
          Expanded(
            child: TabBarView(
              children: [
                Login(),
                Register(),
              ],
            ),
          ),
        ],
      ),
    ));
    ;
  }
}
