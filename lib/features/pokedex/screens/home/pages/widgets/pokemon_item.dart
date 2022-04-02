import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';
import 'package:flutter_pokemon/features/pokedex/screens/home/pages/widgets/pokemon_type.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pokemon.baseColor!.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(pokemon.name),
            Row(
              children: [
                Column(
                  children: pokemon.type
                      .map((e) => PokemonType(
                            name: e,
                          ))
                      .toList(),
                ),
                Flexible(child: Image.network(pokemon.img)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
