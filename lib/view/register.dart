import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:get/get.dart';
import 'package:capyba_app/controller/sign_up.dart';

import '../controller/show_preview.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '';
  String password = '';
  String confirmationPassword = '';
  late File picture;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _imageBox(),
            _bigSpacer(),
            _emailInput(),
            _tinySpacer(),
            _passwordInput(),
            _tinySpacer(),
            _confirmPassword(),
            _tinySpacer(),
            Row(
              children: [
                _pictureButton(),
              ],
            ),
            _bigSpacer(),
            _registerButton(),
          ],
        ),
      ),
    );
  }

  _imageBox() {
    SizedBox(
      height: 200.0,
      width: 200.0,
      child: Image.asset('capyba_simbolo.png'),
    );
  }

  _emailInput() {
    TextFormField(
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
    TextFormField(
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

  _confirmPassword() {
    TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Digite novamente a senha',
      ),
      validator: (input) => input == '' ? 'Repita novamente a senha' : null,
      onSaved: (value) => confirmationPassword = value!,
    );
  }

  _tinySpacer() {
    const SizedBox(
      height: 16,
    );
  }

  _bigSpacer() {
    const SizedBox(
      height: 32,
    );
  }

  _pictureButton() {
    ElevatedButton.icon(
      onPressed: () => Get.to(() => CameraCamera(
            onFile: (file) => showPreview(file),
            cameraSide: CameraSide.front,
          )),
      icon: const Icon(Icons.camera_alt),
      label: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Tire uma foto'),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          textStyle: const TextStyle(
            fontSize: 16,
          )),
    );
  }

  _registerButton() {
    FloatingActionButton.extended(
      onPressed: () {
        if (password != confirmationPassword) {
          showDialog(
            context: context,
            builder: (_) => _invalidPassword(),
            barrierDismissible: false,
          );
        } else if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          signUp(email, password, _formKey.currentState, context);
        }
      },
      extendedPadding: const EdgeInsets.all(16.0),
      label: const Text(
        "Cadastrar",
      ),
    );
  }

  Widget _invalidPassword() {
    return AlertDialog(
      title: const Text('Erro'),
      content: const Text('As senhas inseridas precisam ser iguais'),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Ok'),
        )
      ],
    );
  }
}
