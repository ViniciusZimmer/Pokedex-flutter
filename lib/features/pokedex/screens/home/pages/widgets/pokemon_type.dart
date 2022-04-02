import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}
