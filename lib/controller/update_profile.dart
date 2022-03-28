import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateProfile(
    String email, String password, _formKey, context) async {
  User? user = FirebaseAuth.instance.currentUser;
  final formState = _formKey.currentState;
  if (formState!.validate()) {
    formState.save();
    try {
      await FirebaseAuth.instance.currentUser?.updateEmail(email);
      await FirebaseAuth.instance.currentUser?.updatePassword(password);
    } catch (e) {
      print(e);
    }
  }
}
