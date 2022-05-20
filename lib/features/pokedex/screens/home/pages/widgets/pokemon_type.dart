import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
      ),
    );
  }
}
