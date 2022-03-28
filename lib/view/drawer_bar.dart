import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _header(),
          _profile(context),
          _emailValidation(context),
          _logoff(context),
        ],
      ),
    );
  }

  _header() {
    const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Text(
        'Capyba App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }

  _profile(BuildContext context) {
    ListTile(
      leading: const Icon(
        Icons.account_circle,
        color: Colors.green,
      ),
      title: const Text(
        'Perfil',
        style: TextStyle(color: Colors.green),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/profile');
      },
    );
  }

  _emailValidation(BuildContext context) {
    ListTile(
      leading: const Icon(
        Icons.email,
        color: Colors.green,
      ),
      title: const Text(
        'Validar Email',
        style: TextStyle(color: Colors.green),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/validation');
      },
    );
  }

  _logoff(BuildContext context) {
    ListTile(
      leading: const Icon(
        Icons.power_settings_new,
        color: Colors.green,
      ),
      title: const Text(
        'Sair',
        style: TextStyle(color: Colors.green),
      ),
      onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, '/');
      },
    );
  }
}
