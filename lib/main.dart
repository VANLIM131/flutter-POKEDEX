import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "pokedex",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("pokedux"),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Text("hellow"),
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.cyan,
          child: Icon(
            Icons.refresh,
          ),
        ));
  }
}
