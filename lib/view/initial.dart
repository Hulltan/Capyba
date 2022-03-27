import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.title))),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 200.0,
              width: 200.0,
              child: Image.asset('capyba_simbolo.png')),
          const SizedBox(
            height: 40,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            },
            backgroundColor: Colors.green,
            label: const Text("Cadastre-se"),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            child: const Text(
              'Já tenho uma conta',
              style: TextStyle(
                color: Colors.green,
                decoration: TextDecoration.underline,
                fontSize: 17,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      )),
    );
  }
}
