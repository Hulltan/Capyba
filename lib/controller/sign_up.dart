import 'package:camera_camera/camera_camera.dart';
import 'package:capyba_app/controller/upload_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp(
    String email, String password, _formKey, context, XFile picture) async {
  final auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late User user;
  final formState = _formKey;
  if (formState!.validate()) {
    formState.save();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      user = auth.currentUser!;
      user.sendEmailVerification();
      uploadImageToFirebase(storage, email, picture);
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseException catch (e) {
      throw Exception('Erro durante o cadastro: ${e.code}');
    }
  }
}
