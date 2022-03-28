import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signIn(String email, String password, _formKey, context) async {
  final auth = FirebaseAuth.instance;
  User? user;
  final formState = _formKey.currentState;
  if (formState!.validate()) {
    formState.save();
    user = auth.currentUser!;
    // if (user.emailVerified) {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_) {
        Navigator.pushNamed(context, '/home');
      });
    } catch (e) {
      print(e);
    }
  }
}
