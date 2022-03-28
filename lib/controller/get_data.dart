import 'package:cloud_firestore/cloud_firestore.dart';

Future getData(String collection) async {
  CollectionReference _collectionRef = FirebaseFirestore.instance.collection(collection);
  QuerySnapshot querySnapshot = await _collectionRef.get();
  final pokedex = querySnapshot.docs.map((doc) => doc.data()).toList();
  return pokedex;
}
