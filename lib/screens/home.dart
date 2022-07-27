// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'),
      ),
      body: Center(
          child: Text(
        "Welcome User.",
        style: TextStyle(
            fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
      )),
    );
  }
}
