import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  // Navigator.pushNamed(context,);
                },
                label: const Text("Cadastre-se"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                child: const Text(
                  'Já tenho uma conta',
                  style: TextStyle(
                      color: Colors.black87, decoration: TextDecoration.underline),
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
