// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prac/config/constants.dart';
import 'package:prac/screens/home.dart';
import 'package:prac/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpServices {
  //register service:
  void Register(
      name, email, password, cpassword, phone_no, BuildContext context) async {
    final prefs = SharedPreferences.getInstance();
    final SharedPreferences _pref = await prefs;
    String url = ApiConst.BaseUrl;
    var userHeader = {"Accept": "application/json"};
    final response = await http.post(
        Uri.parse(
            '$url/register?name=$name&email=$email&password=$password&confirm_password=$cpassword&phone=$phone_no'),
        headers: userHeader);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      print(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    } else {
      print('Error');
    }
  }

  //login service:
  void Login(user, password, BuildContext context) async {
    String url = ApiConst.BaseUrl;
    final prefs = SharedPreferences.getInstance();
    final SharedPreferences _pref = await prefs;
    var userHeader = {"Accept": "application/json"};
    final response = await http.post(
        Uri.parse('$url/login?email=$user&password=$password'),
        headers: userHeader);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var token = data['data']['token'];
      var savetoken = _pref.setString('new', token);
      var gettoken = _pref.getString('new');

      print(token);
      print("asssssssssss" + gettoken.toString());

      print(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      print('Error');
    }
  }
}
