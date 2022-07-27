// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prac/config/constants.dart';
import 'package:prac/screens/home.dart';
import 'package:prac/screens/login.dart';

class HttpServices {
  void Login(user, password, BuildContext context) async {
    String url = ApiConst.BaseUrl;
    var userHeader = {"Accept": "application/json"};
    final response = await http.post(
        Uri.parse('$url/login?email=$user&password=$password'),
        headers: userHeader);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var token = data['data']['token'];
      print(response.body);
      print(token);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      print('Error');
    }
  }
}
