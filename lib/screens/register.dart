// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../service/login_service.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController cpassword_controller = TextEditingController();
  TextEditingController phoneno_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name_controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Enter your name.",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: email_controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter your email.",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            maxLength: 8,
            controller: password_controller,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "Enter your password.",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            maxLength: 8,
            controller: cpassword_controller,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "confirm password",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: phoneno_controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Enter your phone.",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              HttpServices().Register(
                  name_controller.text.trim(),
                  email_controller.text.trim(),
                  password_controller.text.trim(),
                  cpassword_controller.text.trim(),
                  phoneno_controller.text.trim(),
                  context);
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('Register')),
            ),
          ),
        ],
      ),
    );
  }
}
