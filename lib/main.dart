import 'package:flutter/material.dart';
import 'screen/auth/login.dart';
import 'package:app_come/screen/modules/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
