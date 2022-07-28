// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prac/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  gettokn() async {
    SharedPreferences prefs = await _prefs;
    var save = prefs.getString('new');
    print(save);
  }

  logout() async {
    SharedPreferences prefs = await _prefs;
    prefs.remove('new');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                gettokn();
              },
              child: Text('Print Current Token'),
            ),
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
