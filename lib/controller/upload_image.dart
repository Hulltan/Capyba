import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

Future uploadImageToFirebase(
    FirebaseStorage storage, String email, XFile? pickedImage) async {
  try {
    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);
    // Uploading the selected image with some custom meta data
    await storage.ref(fileName).putFile(
        imageFile,
        SettableMetadata(customMetadata: {
          'uploaded_by': email,
          'description': 'Some description...'
        }));
  } on FirebaseException catch (error) {
    throw Exception('Erro na foto');
  }
}
