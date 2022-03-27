import 'package:flutter/material.dart';
import 'package:capyba_app/view/initial.dart';
import 'package:capyba_app/view/login.dart';
import 'package:capyba_app/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capyba Software',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(title: 'Capyba App'),
        '/login': (context) => const LoginPage(title: "Entrar"),
        '/register': (context) => const RegisterPage(title: "Cadastro"),
      },
    );
  }
}
