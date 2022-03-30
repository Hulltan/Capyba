import 'package:capyba_app/view/decision_page.dart';
import 'package:capyba_app/view/home.dart';
import 'package:capyba_app/view/profile_management.dart';
import 'package:capyba_app/view/validation_management.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:capyba_app/view/initial.dart';
import 'package:capyba_app/view/login.dart';
import 'package:capyba_app/view/register.dart';
import 'package:capyba_app/view/open_area.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Capyba Software',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "decision",
      routes: {
        "decision": (context) => const DecisionPage(),
        "/": (context) => const InitialPage(title: 'Capyba App'),
        "/login": (context) => const LoginPage(title: "Entrar"),
        "/register": (context) => const RegisterPage(title: "Cadastro"),
        "/home": (context) => const Homepage(title: "Capyba"),
        "/openArea": (context) => const OpenPage(),
        "/profile": (context) => const ProfilePage(title: "Perfil"),
        "/validation": (context) => const ValidationPage(title: "Validar Email"),
      },
    );
  }
}
