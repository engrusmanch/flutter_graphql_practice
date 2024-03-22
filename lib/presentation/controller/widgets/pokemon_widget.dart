import 'package:flutter/material.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${pokemon.name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Height: ${pokemon.height}',
              ),
              Text(
                'Weight: ${pokemon.weight}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
