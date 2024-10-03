import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_pizza_riverpod/service/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pizza_riverpod/models/user.dart' as app;

final firebaseProvider = StateProvider<User?>((ref) => null);

final firebaseNotifier = StateNotifierProvider<FirebaseProvider, FirebaseAuth?>(
    (ref) => FirebaseProvider(ref));

class FirebaseProvider extends StateNotifier<FirebaseAuth?> {
  Ref ref;
  FirebaseProvider(this.ref) : super(null);

  Future<void> initialize() async {
    state = FirebaseAuth.instance;
    if (state != null) {
      state!.authStateChanges().listen(
        (User? user) {
          if (user == null) {
            ref.read(firebaseProvider.notifier).state = null;
          } else {
            ref.read(firebaseProvider.notifier).state = user;
          }
        },
      );
      if (state?.currentUser != null) {
        final user = state?.currentUser;
        final snapshot = await FirebaseFirestore.instance
            .collection('user')
            .doc(user!.uid)
            .get();
        ref.read(userProvider.notifier).state =
            app.User.fromSnapshot(snapshot.data(), user.uid);
      }
    }
  }

  Future<UserCredential?> register(
      {required String email, required String password}) async {
    try {
      return await state!.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<bool> logout() async {
    try {
      await state!.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return false;
  }

  Future<UserCredential?> login(
      {required String email, required String password}) async {
    try {
      var t = await state!.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(state);
      return t;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return null;
  }
}
