import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon/features/pokedex/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(dio: Dio()),
      ),
    );
  }
}
