import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:get/get.dart';
import 'package:capyba_app/view/picture_preview.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String password = '';
  String confirmationPassword = '';
  String email = '';
  late File picture;
  final _formKey = GlobalKey<FormState>();

  showPreview(picture) async {
    File? pic = await Get.to(() => PreviewPage(picture: picture));

    if (pic != null) {
      setState(() => picture = pic);
      Get.back();
    }
  }

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
            SizedBox(
                height: 200.0,
                width: 200.0,
                child: Image.asset('capyba_simbolo.png')),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              validator: (input) => input == '' ? 'Digite um email' : null,
              onSaved: (value) => email = value!,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              //deixa a senha secreta
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
              validator: (input) => input == '' ? 'Digite uma senha' : null,
              onSaved: (value) => password = value!,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite novamente a senha',
              ),
              validator: (input) =>
                  input == '' ? 'Repita novamente a senha' : null,
              onSaved: (value) => confirmationPassword = value!,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
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
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
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
                  // Navigator.pushNamed(context, '');
                  // SingUp(email, password, _formKey.currentState, context);
                }
              },
              extendedPadding: const EdgeInsets.all(16.0),
              label: const Text(
                "Cadastrar",
              ),
            ),
          ],
        ),
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
