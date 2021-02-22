import 'package:flutter/material.dart';
import 'pokemon.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  Pokemon pokemon;
  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            pokemon.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
                letterSpacing: 1),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(50),
                      bottom: Radius.circular(50),
                    )),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  backgroundImage: NetworkImage(pokemon.sprites.frontDefault),
                ),
              ),
            ],
          ),
          Expanded(
            flex: -1,
            child: Container(
              height: 120,
              child: ListView.builder(
                  itemCount: pokemon.types.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 180, vertical: 8),
                      child: Text(
                        pokemon.types[index].type.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('${pokemon.weight / 10} KG',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  Text('Weight',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white70,
                      )),
                ],
              ),
              Column(
                children: [
                  Text('${pokemon.height / 10} M',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  Text('Height',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white70,
                      )),
                ],
              ),
            ],
          ),
          Text(
            "Status",
            style: TextStyle(
              fontSize: 50,
              color: Colors.pink,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: pokemon.stats.length,
                itemBuilder: (context, index) {
                  final list = pokemon.stats[index];
                  return Column(
                    children: [
                      Text(
                        '${list.stat.name} ${list.baseStat}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
