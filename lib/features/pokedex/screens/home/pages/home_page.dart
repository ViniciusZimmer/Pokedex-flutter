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
      // backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text('Pokedex'),
        elevation: 0.0,
      ),
      body: _body(),
    );
  }

  _list() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (final pokemon in list)
            PokemonItem(
              pokemon: pokemon,
              onTap: onItemClick,
            ),
        ],
      ),
    );
  }

  _body() {
    return Stack(
      children: [
        _list(),
      ],
    );
  }
}
