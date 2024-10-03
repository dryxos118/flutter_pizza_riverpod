import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pizza_riverpod/service/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends HookConsumerWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pseudo = useState("");
    final password = useState("");
    final obscureText = useState(false);
    final user = ref.watch(userProvider);

    Future<void> submitForm(VoidCallback onSubmited) async {
      if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState?.save();
        print(pseudo.value);
        print(password.value);

        // Exécution de la logique de login
        await ref
            .watch(userNotifier.notifier)
            .loginInFirebase(email: pseudo.value, password: password.value);

        // Si tout est OK, exécuter le callback
        if (user != null) {
          onSubmited();
        }
      }
    }

    void togglePasswordVisibility() {
      obscureText.value = !obscureText.value;
    }

    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: const Color.fromARGB(222, 226, 239, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Se conecter",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer votre pseudo !';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        pseudo.value = value ?? '';
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: togglePasswordVisibility,
                          )),
                      obscureText: !obscureText.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez votre password !';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password.value = value ?? '';
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => submitForm(
                        () => context.go("/"),
                      ),
                      child: const Text('Connection'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
