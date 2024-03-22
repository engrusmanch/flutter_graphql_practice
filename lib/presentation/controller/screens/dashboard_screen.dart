import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:graphql_api_integration_practice/constants.dart';
import 'package:graphql_api_integration_practice/presentation/controller/controller.dart';
import 'package:graphql_api_integration_practice/presentation/controller/screens/anilist_screen.dart';
import 'package:graphql_api_integration_practice/presentation/controller/screens/countries_screen.dart';
import 'package:graphql_api_integration_practice/presentation/controller/screens/pokemon_screen.dart';
import 'package:graphql_api_integration_practice/presentation/controller/screens/rick_and_morty_screen.dart';
import 'package:graphql_api_integration_practice/presentation/controller/screens/star_wars_screen.dart';
import 'package:graphql_api_integration_practice/presentation/controller/widgets/dashboard_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    GraphQLController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 16.0, // Spacing between columns
        mainAxisSpacing: 16.0, // Spacing between rows
        padding: EdgeInsets.all(16.0), // Padding around the grid
        children: [
          DashboardWidget(
            image: anilistImage,
            text: 'Anilist',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AnilistScreen(),
              ));
              controller.fetchAniListData();
            },
          ),
          DashboardWidget(
            image: starWarsImage,
            text: 'Star Wars',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StarWarsScreen(),
              ));
              controller.fetchStarWarsFilmsData();
            },
          ),
          DashboardWidget(
            image: pokemonImage,
            text: 'Pokemon',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PokemonScreen(),
              ));
              controller.fetchPokemonData();
            },
          ),
          DashboardWidget(
            image: rickMortyImage,
            text: 'Rick and Morty',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CharacterScreen(),
              ));
              controller.fetchCharacterData();
            },
          ),
          DashboardWidget(
            image: countryImage,
            text: 'Countries',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CountriesScreen(),
              ));
              controller.fetchCountriesData();
            },
          ),
        ],
      ),
    );
  }
}