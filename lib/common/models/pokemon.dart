import 'package:flutter/material.dart';

class NextEvolution {
  final String? num;
  final String? name;

  NextEvolution({this.num, this.name});

  factory NextEvolution.fromMap(Map<String, dynamic> json) {
    return NextEvolution(
      num: json['num'] as String?,
      name: json['name'] as String?,
    );
  }
}

class Pokemon {
  final String name;
  final List<String> type;
  final int id;
  final String num;
  final String img;
  final String egg;
  final String height;
  final String weight;
  final List<String> weaknesses;
  // final List<NextEvolution> nextEvolution;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
      img: json['img'],
      egg: json['egg'],
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
      height: json['height'],
      weight: json['weight'],
      // nextEvolution: (json['next_evolution'] as List<dynamic>)
      //     .map(
      //       (e) => NextEvolution.fromMap(e as Map<String, dynamic>),
      //     )
      //     .toList(),
    );
  }

  Color? get baseColor => _color(type: type[0]);

  Pokemon({
    required this.img,
    required this.name,
    required this.type,
    required this.id,
    required this.num,
    required this.egg,
    required this.weaknesses,
    required this.height,
    required this.weight,
    // required this.nextEvolution,
  });

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
