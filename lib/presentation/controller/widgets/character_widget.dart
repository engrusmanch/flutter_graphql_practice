import 'package:flutter/material.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/rick_and_morty.dart';

class CharacterWidget extends StatelessWidget {
  final RickMortyCharacterEntity character;

  const CharacterWidget({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.5,
      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${character.name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Species: ${character.species}',
              ),
              SizedBox(height: 8),
              Image.network(
                character.image!,
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.34,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}