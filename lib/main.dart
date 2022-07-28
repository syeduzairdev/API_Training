// ignore_for_file: prefer_const_constructors, dead_code, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prac/screens/home.dart';
import 'package:prac/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //background services etc.
  WidgetsFlutterBinding();
  //var for SharedPreferences.getInstance()
  final prefs = SharedPreferences.getInstance();
  //var for await prefs
  final SharedPreferences _bbpref = await prefs;
  //var for saved token via login.
  var gettoken = _bbpref.getString('new');

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(
    //constructor for getting token status
    tkn: gettoken.toString(),
  ));
}

class MyApp extends StatelessWidget {
  //var for token status
  final tkn;
  //constructor to use for the status of token
  const MyApp({Key? key, required this.tkn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Register(),
      home: tkn.toString() == null ? LogIn() : HomeScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
