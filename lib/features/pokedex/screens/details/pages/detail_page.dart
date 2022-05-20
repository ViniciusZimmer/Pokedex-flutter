import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.baseColor!,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
        backgroundColor: pokemon.baseColor!,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    'Types',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(t),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
                )),
          )
        ],
      );
}
