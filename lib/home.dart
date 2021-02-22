import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';
import 'page.dart';
//import 'dart:io';

class HomePage extends StatefulWidget {
  static const String url =
      'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pokemons pokemon;

  // ignore: missing_return
  Future<List<Pokemons>> _fetchData() async {
    final response = await http.get(HomePage.url);
    final decode = json.decode(response.body);
    final data = Pokemons.fromJson(decode['results']);
    print(data.pokemons);

    setState(() {
      pokemon = data;
    });
  }

  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text("PokeDex"),
        centerTitle: false,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              //onTap: ()=> exit(0),
            ),
          ],
        ),
      ),
      body: Container(
        child: pokemon == null
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    pokemon.pokemons.length,
                    (index) => PokeCard(
                          pokeURL: pokemon.pokemons[index].url,
                        )),
              ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final search = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: appbar action
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: leading icon to left bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {});
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: show results
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: shows something when searched
  }
}
