import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title)),
      body: Column(
        children: [
          _emailField(user),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _validationButton(user),
            ],
          ),
        ],
      ),
    );
  }

  _emailField(User? user) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: user!.email,
            ),
          ),
        ],
      ),
    );
  }

  _validationButton(User? user) {
    return ElevatedButton.icon(
      onPressed: () {
        user!.sendEmailVerification();
        showDialog(
          context: context,
          builder: _popup(),
        );
      },
      label: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Enviar Validação'),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0.0, textStyle: const TextStyle(fontSize: 16)),
      icon: const Icon(Icons.send),
    );
  }

  _popup() {
    return AlertDialog(
      title: const Text("Validação enviada com sucesso"),
      content:
          const Text("Por favor verifique a caixa de entrada do seu email."),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Ok'),
        )
      ],
    );
  }
}
