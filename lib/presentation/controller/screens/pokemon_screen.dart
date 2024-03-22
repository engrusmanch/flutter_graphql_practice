import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/builder_ids.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:graphql_api_integration_practice/presentation/controller/widgets/pokemon_widget.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphQLController>(
        id: pokemonId,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Pokemon Data",
              ),
            ),
            body: controller.pokemonLoadingState.isLoading
                ? Center(
              child: Column(
                children: [
                  Text("Fetching Pokemon Data"),
                  CircularProgressIndicator(),
                ],
              ),
            )
                : SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(
                    controller.pokemonData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                          child: PokemonWidget(pokemon:controller.pokemonData[index]),
                        )
                ),
              ),
            ),
          );
        }
    );
  }
}
