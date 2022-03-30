import 'package:capyba_app/controller/sign_in.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
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
            _loginButton(),
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
      keyboardType: TextInputType.emailAddress,
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

  _loginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          signIn(email, password, _formKey, context);
        }
      },
      backgroundColor: Colors.green,
      label: const Text(
        "Entrar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
