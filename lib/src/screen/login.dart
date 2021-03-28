import 'package:authentication_demo/src/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('SignIn'),
                    onPressed: () {
                      auth.signInWithEmailAndPassword(
                          email: _email, password: _password);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    }),
                RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('SignUp'),
                    onPressed: () {
                      auth.createUserWithEmailAndPassword(
                          email: _email, password: _password);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
