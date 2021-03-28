import 'package:authentication_demo/src/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme:
          ThemeData(accentColor: Colors.lightGreen, primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
