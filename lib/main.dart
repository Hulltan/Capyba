import 'package:flutter/material.dart';
import 'package:capyba_app/view/home.dart';
import 'package:capyba_app/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capyba App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'Capyba Software'),
        '/login': (context) => const LoginPage(title: "Login"),
      }
    );
  }
}
















