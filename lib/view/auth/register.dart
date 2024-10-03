import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pizza_riverpod/models/promo.dart';
import 'package:flutter_pizza_riverpod/models/user.dart';
import 'package:flutter_pizza_riverpod/service/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Register extends HookConsumerWidget {
  Register({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _obscureText = useState(false);
    final pseudo = useState("");
    final email = useState("");
    final password = useState("");
    final selectedPromotion = useState(Promo.CDA);
    void submitForm() {
      if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState?.save();
        User user = User(promo: selectedPromotion.value);
        ref.watch(userNotifier.notifier).registerInFirebase(
            user: user, email: email.value, password: password.value);
      }
    }

    void togglePasswordVisibility() {
      _obscureText.value = !_obscureText.value;
    }

    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
              color: const Color.fromARGB(222, 226, 239, 255),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Crée un compte',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Pseudo'),
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
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez votre email !';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Entrez une email valide !';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email.value = value ?? '';
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: togglePasswordVisibility,
                          )),
                      obscureText: !_obscureText.value,
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
                    DropdownButtonFormField<Promo>(
                      decoration: const InputDecoration(labelText: 'Promotion'),
                      value: selectedPromotion.value,
                      items: Promo.values.map((Promo role) {
                        return DropdownMenuItem<Promo>(
                          value: role,
                          child: Text(role.toString().split('.').last),
                        );
                      }).toList(),
                      onChanged: (Promo? newValue) {
                        selectedPromotion.value = newValue!;
                      },
                      onSaved: (value) {
                        selectedPromotion.value = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: submitForm,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
