import 'package:capyba_app/view/open_area.dart';
import 'package:capyba_app/view/restricted_area.dart';
import 'package:capyba_app/view/drawer_bar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerBar(),
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(text: "Public Section"),
            Tab(text: "Restricted section"),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          OpenPage(),
          RestrictedPage(),
        ],
      ),
    );
  }
}
