import 'package:dio/dio.dart';
import 'package:graphql_api_integration_practice/api_urls.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/anilist.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/country.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/pokemon.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/rick_and_morty.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/star_wars.dart';

import 'package:dio/dio.dart';

abstract class GraphQLApiRemoteSource {
  Future<List<CountryEntity>> getCountriesData();
  Future<List<AniListEntity>> getAnilistData();
  Future<List<PokemonEntity>> getPokemonList();
  Future<List<RickMortyCharacterEntity>> getCharacterData({String? character});
  Future<List<FilmEntity>> getStarWarsFilms();
}

class GraphQLApiRemoteSourceImpl implements GraphQLApiRemoteSource {
  GraphQLApiRemoteSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<AniListEntity>> getAnilistData() async {
    final response = await _dio.post(
      anilistApiUrl,
      data: {
        'query':
            '{ Page { media { siteUrl title { english native } description characters { nodes { image { large } } } } } }',
      },
    );
    final data = response.data['data']['Page']['media'] as List<dynamic>;

    return data.map((json) => AniListEntity.fromJson(json)).toList();
  }

  @override
  Future<List<RickMortyCharacterEntity>> getCharacterData(
      {String? character}) async {
    final response = await _dio.post(
      rickMortyApiUrl,
      data: {
        'query':
            '{ characters(page: 2, filter: { name: "$character" }) { info { count } results { name species image } } }',
      },
    );
    final data =
        response.data['data']['characters']['results'] as List<dynamic>;
    return data.map((json) => RickMortyCharacterEntity.fromJson(json)).toList();
  }

  @override
  Future<List<CountryEntity>> getCountriesData() async {
    final response = await _dio.post(
      countriesApiUrl,
      data: {
        'query':
            '{ countries { code name emoji currencies phone capital languages { native name } states { name } continent { name } } }',
      },
    );
    final data = response.data['data']['countries'] as List<dynamic>;
    return data.map((json) => CountryEntity.fromJson(json)).toList();
  }

  @override
  Future<List<PokemonEntity>> getPokemonList() async {
    final response = await _dio.post(
      pokemonApiUrl,
      data: {
        'query':
            '{ gen1_species: pokemon_v2_pokemonspecies(where: { pokemon_v2_generation: { name: { _eq: "generation-i" } } } order_by: { id: asc }) { name id pokemon_v2_pokemons { id name height weight } } }',
      },
    );
    final data = response.data['data']['gen1_species'] as List<dynamic>;
    final List<Gen1SpeciesEntity> gen1 =
        data.map((json) => Gen1SpeciesEntity.fromJson(json)).toList();
    // Flatten the list of pokemons
    final List<PokemonEntity> pokemonList = gen1
        .expand((gen1Entity) => gen1Entity.pokemons!)
        .toList()
        .cast<PokemonEntity>();

    return pokemonList;
  }

  @override
  Future<List<FilmEntity>> getStarWarsFilms() async {
    final response = await _dio.post(
      starWarsApiUrl,
      data: {
        'query':
            '{ allFilms { films { title director releaseDate openingCrawl characterConnection { characters { name } } producers } } }',
      },
    );
    final data = response.data['data']['allFilms']['films'] as List<dynamic>;
    return data.map((json) => FilmEntity.fromJson(json)).toList();
  }
}
