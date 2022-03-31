import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/get_data.dart';

class RestrictedPage extends StatefulWidget {
  const RestrictedPage({Key? key}) : super(key: key);

  @override
  _RestrictedPageState createState() => _RestrictedPageState();
}

class _RestrictedPageState extends State<RestrictedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _tryGetCollection(),
    );
  }

  Widget _tryGetCollection() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      return _missingValidation();
    } else {
      return _pokemonList();
    }
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

  Widget _missingValidation() {
    return AlertDialog(
      title: const Text("Erro: Validação pendente"),
      content: const Text(
          "Apenas usuários que confirmaram seu email podem acessar essa área. "
          "Por favor, verifique sua caixa de entrada ou acesse Validar Email "
          "clicando no icone que se encontra no canto superior esquerdo."),
      actions: [
        ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed("/home"),
            child: const Text("Ok"))
      ],
    );
  }
}
