import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';
import 'package:flutter_pokemon/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon/features/pokedex/screens/details/pages/detail_loading.dart';
import 'package:flutter_pokemon/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  final String name;
  final String? img;
  const DetailArguments({required this.name, this.img});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DetailLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(name: arguments.name, list: snapshot.data!);
          }

          if (snapshot.hasError) {}

          return Container();
        });
  }
}
