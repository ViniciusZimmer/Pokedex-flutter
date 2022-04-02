import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokemon/features/pokedex/screens/home/pages/widgets/pokemon_item.dart';

import '../../../../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemClick})
      : super(key: key);
  final Function(String, DetailArguments) onItemClick;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: list.map((e) => PokemonItem(pokemon: e)).toList(),
        ),
      ),
    );
  }
}
