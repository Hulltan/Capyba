import 'package:flutter/material.dart';
import '../controller/get_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _pokemonList(),
    );
  }

  Widget _pokemonList() {
    return StreamBuilder<QuerySnapshot>(
      stream: getData("open_collection"),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                child: ListTile(
                  leading: Text(doc['id']),
                  title: Text(doc['name']),
                  subtitle: Text(doc['category']),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
