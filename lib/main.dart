import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pizza_riverpod/firebase_options.dart';
import 'package:flutter_pizza_riverpod/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pizza_riverpod/service/fireauth_provider.dart';
import 'package:flutter_pizza_riverpod/service/pizza_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(
      () => {
        ref.read(pizzaProviderNotifier.notifier).loadPizzas(),
      },
    );

    Future.microtask(() => {ref.read(firebaseNotifier.notifier).initialize()});

    return ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
