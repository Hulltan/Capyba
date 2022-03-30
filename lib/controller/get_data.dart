import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot<Map<String, dynamic>>> getData(String collection) {
  final db = FirebaseFirestore.instance;
  return db.collection('open_collection').snapshots();
}
