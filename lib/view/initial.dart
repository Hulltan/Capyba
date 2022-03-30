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
              _spacer(),
              _imageBox(),
              _spacer(),
              _registerButton(),
              _separator(),
              _alreadyRegisterButton(),
            ],
          )),
    );
  }

  _imageBox() {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: Image.asset('assets/capyba_simbolo.png'),
    );
  }

  _spacer() {
    return const SizedBox(
      height: 40,
    );
  }

  _registerButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pushNamed('/register');
      },
      backgroundColor: Colors.green,
      label: const Text(
        "Cadastre-se",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }

  _separator() {
    return const SizedBox(
      height: 15,
    );
  }

  _alreadyRegisterButton() {
    return TextButton(
      child: const Text(
        'Já tenho uma conta',
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontSize: 17,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/login');
      },
    );
  }
}
