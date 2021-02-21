import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Project",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Google',
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}
