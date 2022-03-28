import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controller/get_data.dart';
import '../model/pokemon.dart';

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
    }
    else {
      return _pokemonList();
    }
  }

  Widget _pokemonList(){
    var pokeList = _getCollection();
    return ListView.builder(
      itemCount: pokeList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(pokeList[index].id),
          title: Text(pokeList[index].name),
          subtitle: Text(pokeList[index].category),
        );
      },
    );
  }

  List<Pokemon> _getCollection() {
    var overUsedPokedex = getData("open_collection") as List<Pokemon>;
    return overUsedPokedex;
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
            onPressed: () => Navigator.of(context).pushNamed("/openArea"),
            child: const Text("Ok"))
      ],
    );
  }
}
