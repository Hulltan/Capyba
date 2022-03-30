import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateProfile(
    String email, String password, _formKey, context) async {
  User? user = FirebaseAuth.instance.currentUser;
  final formState = _formKey.currentState;
  if (formState!.validate()) {
    formState.save();
    try {
      await user?.updateEmail(email);
      await user?.updatePassword(password);
    } on FirebaseException catch (e) {
      throw Exception('Erro durante a aualização do perfil: ${e.code}');
    }
  }
}
