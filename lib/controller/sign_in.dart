import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signIn(String email, String password, _formKey, context) async {
  final formState = _formKey.currentState;
  if (formState!.validate()) {
    formState.save();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .then((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } on FirebaseException catch (e) {
      throw Exception('Erro durante o login: ${e.code}');
    }
  }
}
