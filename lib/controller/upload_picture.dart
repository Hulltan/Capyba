import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

Future uploadImageToFirebase(String email, File? picture) async {
  String fileName = email;
  UploadTask? uploadTask;
  final path = 'files/$fileName';
  try {
    final ref = FirebaseStorage.instance
        .ref(path)
        .child('images/');
    uploadTask =  ref.putFile(picture!);
    final snapshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();

  } on FirebaseException catch (e) {
    throw Exception('Erro durante o upload da imagem: ${e.code}');
  }
}
  // Reference firebaseStorageRef =
  //     FirebaseStorage.instance.ref().child('images/$fileName');
  // UploadTask uploadTask = firebaseStorageRef.putFile(picture);
  // TaskSnapshot taskSnapshot = await uploadTask;
  // taskSnapshot.ref.getDownloadURL().then(
  //       (value) => print("Done: $value"),
  //     );
// }
