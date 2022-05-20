import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';
import 'package:flutter_pokemon/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokemon/features/pokedex/screens/home/pages/widgets/pokemon_type.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key, required this.pokemon, required this.onTap})
      : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
          '/details',
          DetailArguments(
            pokemon: pokemon,
          )),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.baseColor!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.black.withOpacity(0.4),
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => PokemonType(
                                  name: e,
                                ))
                            .toList(),
                      ),
                      // Flexible(
                      //   child: Container(
                      //     height: 100,
                      //     width: 100,
                      //     // child: Flexible(
                      //     //   child: ,
                      //     // ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 4,
            height: 50,
            width: 50,
            child: Image.network(
              pokemon.img,
              // fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
