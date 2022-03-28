import 'package:capyba_app/model/pokemon.dart';
import 'package:flutter/material.dart';
import '../controller/get_data.dart';

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
    var littleCupPokedex = getData("open_collection") as List<Pokemon>;
    return littleCupPokedex;
  }
}