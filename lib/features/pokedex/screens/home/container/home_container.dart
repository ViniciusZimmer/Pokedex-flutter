import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/error/failure.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';
import 'package:flutter_pokemon/common/repositories/pokemon_repository.dart';

import '../pages/home_error.dart';
import '../pages/home_loading.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
