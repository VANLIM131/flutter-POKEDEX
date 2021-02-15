import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Pokedex Demo'),
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.greenAccent,
          body: Center(
            child: Column(
              children: [Text('poke')],
            ),
          )),
    );
  }
}
