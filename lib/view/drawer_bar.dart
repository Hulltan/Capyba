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
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Text(
        'Capyba App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  _profile(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.account_circle,
      ),
      title: const Text(
        'Perfil',
      ),
      onTap: () {
        Navigator.pushNamed(context, '/profile');
      },
    );
  }

  _emailValidation(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.email,
      ),
      title: const Text(
        'Validar Email',
      ),
      onTap: () {
        Navigator.pushNamed(context, '/validation');
      },
    );
  }

  _logoff(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.power_settings_new,
      ),
      title: const Text(
        'Sair',
      ),
      onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushNamedAndRemoveUntil(context, 'decision', (_) => false);
      },
    );
  }
}
