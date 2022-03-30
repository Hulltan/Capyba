import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controller/update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = '';
  String password = '';
  User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(widget.title)),
        body: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          margin: const EdgeInsets.all(20.0),
          child: _formUI(),
        ));
  }

  Widget _formUI() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _imageBox(),
            _bigSpacer(),
            _emailInput(),
            _tinySpacer(),
            _passwordInput(),
            _bigSpacer(),
            _saveButton(),
          ],
        ),
      ),
    );
  }

  _imageBox() {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: Image.asset('assets/capyba_simbolo.png'),
    );
  }

  _tinySpacer() {
    return const SizedBox(
      height: 16,
    );
  }

  _bigSpacer() {
    return const SizedBox(
      height: 32,
    );
  }

  _emailInput() {
    return TextFormField(
      initialValue: user?.email,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
      validator: (input) => input == '' ? 'Digite um email' : null,
      onSaved: (value) => email = value!,
    );
  }

  _passwordInput() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Senha',
      ),
      validator: (input) => input == '' ? 'Digite uma senha' : null,
      onSaved: (value) => password = value!,
    );
  }

  _saveButton() {
    return ElevatedButton.icon(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          updateProfile(email, password, _formKey, context);
          showDialog(
            context: context,
            builder: _updatePopup(),
          );
        }
      },
      icon: const Icon(Icons.save),
      label: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Salvar'),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          textStyle: const TextStyle(
            fontSize: 16,
          )),
    );
  }

  _updatePopup() {
    return AlertDialog(
      title: const Text("Salvo"),
      content:
      const Text("Dados alterados com sucesso."),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Ok'),
        )
      ],
    );
  }
}
