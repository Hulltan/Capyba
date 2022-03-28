import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp(String email, String password, _formKey, context) async {
  final auth = FirebaseAuth.instance;
  late User user;
  final formState = _formKey;

  if (formState!.validate()) {
    formState.save();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user = auth.currentUser!;
      user.sendEmailVerification();
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print(e);
    }
  }
}
