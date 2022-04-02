import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.name,
    required this.list,
  }) : super(key: key);
  final String name;
  final List<Pokemon> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView(
                children: list
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(e.name),
                        ))
                    .toList(),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
