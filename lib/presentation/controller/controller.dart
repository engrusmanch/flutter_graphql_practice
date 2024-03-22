import 'package:get/get.dart';
import 'package:graphql_api_integration_practice/builder_ids.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/anilist.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/country.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/pokemon.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/rick_and_morty.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/star_wars.dart';
import 'package:graphql_api_integration_practice/domain/repositories/repo.dart';

enum LoadingState {
  loading,
  loaded,
  error;

  bool get isLoading => this == LoadingState.loading;
  bool get errorOccurred => this == LoadingState.error;
}

class GraphQLController extends GetxController {
  final GraphQLApiRepo repo;
  GraphQLController({required this.repo});
  LoadingState anilistLoadingState = LoadingState.loading;
  LoadingState characterDataLoadingState = LoadingState.loading;
  LoadingState countriesLoadingState = LoadingState.loading;
  LoadingState pokemonLoadingState = LoadingState.loading;
  LoadingState starWarsFilmsLoadingState = LoadingState.loading;
  RxList<AniListEntity> aniListData = <AniListEntity>[].obs;
  RxList<RickMortyCharacterEntity> characterData =
      <RickMortyCharacterEntity>[].obs;
  RxList<CountryEntity> countriesData = <CountryEntity>[].obs;
  RxList<PokemonEntity> pokemonData = <PokemonEntity>[].obs;
  RxList<FilmEntity> starWarsFilmsData = <FilmEntity>[].obs;
  List selectedCharacters = [];
  String error = "";
  setCharacter({bool selected = false, String label = "Rick"}) {
    if (selected) {
      selectedCharacters.clear();
      selectedCharacters.add(label);
      fetchCharacterData();
      update([charactersId]);
    } else {
      selectedCharacters.remove(label);
      fetchCharacterData();
      update([charactersId]);
    }
  }

  Future<void> fetchAniListData() async {
    try {
      anilistLoadingState = LoadingState.loading;
      update([anilistId]);
      aniListData.value = await repo.getAnilistData();
      anilistLoadingState = LoadingState.loaded;
      update([anilistId]);
    } catch (e) {
      // Handle error
      pokemonLoadingState = LoadingState.error;
    }
  }

  Future<void> fetchCharacterData() async {
    try {
      characterDataLoadingState = LoadingState.loading;
      update([charactersId]);
      characterData.value = await repo.getCharacterData(
          character: selectedCharacters.firstOrNull);
      characterDataLoadingState = LoadingState.loaded;
      update([charactersId]);
    } catch (e) {
      // Handle error
      error = e.toString();
      pokemonLoadingState = LoadingState.error;
    }
  }

  Future<void> fetchCountriesData() async {
    try {
      countriesLoadingState = LoadingState.loading;
      update([countriesId]);
      countriesData.value = await repo.getCountriesData();
      countriesLoadingState = LoadingState.loaded;
      update([countriesId]);
    } catch (e) {
      // Handle error
      pokemonLoadingState = LoadingState.error;
    }
  }

  Future<void> fetchPokemonData() async {
    try {
      pokemonLoadingState = LoadingState.loading;
      update([pokemonId]);
      pokemonData.value = await repo.getPokemonList();
      pokemonLoadingState = LoadingState.loaded;
      update([pokemonId]);
    } catch (e) {
      // Handle error
      pokemonLoadingState = LoadingState.error;
    }
  }

  Future<void> fetchStarWarsFilmsData() async {
    try {
      starWarsFilmsLoadingState = LoadingState.loading;
      update([starWarsId]);
      starWarsFilmsData.value = await repo.getStarWarsFilms();
      starWarsFilmsLoadingState = LoadingState.loaded;
      update([starWarsId]);
    } catch (e) {
      pokemonLoadingState = LoadingState.error;
      // Handle error
    }
  }
}
