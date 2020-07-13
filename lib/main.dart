import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_guide/screens/login_page.dart';
import 'app.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Travel Guide',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  bool isLoggedIn = false;
  Future<bool> isUserLoggedIn() async {
    if (await FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    // ignore: unrelated_type_equality_checks
    if (isUserLoggedIn() != false) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  Widget _loginCheckerWidget() {
    if (isLoggedIn) {
      return DefaultTabController(
        length: 4,
        child: App(),
      );
    } else {
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loginCheckerWidget();
  }
}
