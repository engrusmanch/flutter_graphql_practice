import 'package:graphql_api_integration_practice/domain/repositories/entities/anilist.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/country.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/pokemon.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/rick_and_morty.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/star_wars.dart';

abstract class GraphQLApiRepo{
Future<List<CountryEntity>> getCountriesData();
Future<List<AniListEntity>> getAnilistData();
Future<List<PokemonEntity>> getPokemonList();
Future<List<RickMortyCharacterEntity>> getCharacterData({String? character});
Future<List<FilmEntity>> getStarWarsFilms();
}