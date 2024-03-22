import 'package:graphql_api_integration_practice/data/remote_data_source.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/anilist.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/country.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/pokemon.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/rick_and_morty.dart';
import 'package:graphql_api_integration_practice/domain/repositories/entities/star_wars.dart';
import 'package:graphql_api_integration_practice/domain/repositories/repo.dart';
import 'package:graphql_api_integration_practice/network_info.dart';

class GraphQLApiRepoImpl implements GraphQLApiRepo {
  final GraphQLApiRemoteSource remoteDataSource;
  final NetworkInfo networkInfo;

  GraphQLApiRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<AniListEntity>> getAnilistData() async {
    try {
      await checkNetwork(networkInfo);
      return remoteDataSource.getAnilistData();
    } catch (e) {
      throw Exception('Failed to fetch Anilist data: $e');
    }
  }

  @override
  Future<List<RickMortyCharacterEntity>> getCharacterData({String? character}) async {
    try {
      await checkNetwork(networkInfo);
      return remoteDataSource.getCharacterData(character: character??"");
    } catch (e) {
      throw Exception('Failed to fetch RickMorty character data: $e');
    }
  }

  @override
  Future<List<CountryEntity>> getCountriesData() async {
    try {
      await checkNetwork(networkInfo);
      return remoteDataSource.getCountriesData();
    } catch (e) {
      throw Exception('Failed to fetch countries data: $e');
    }
  }

  @override
  Future<List<PokemonEntity>> getPokemonList() async {
    try {
      await checkNetwork(networkInfo);
      return remoteDataSource.getPokemonList();
    } catch (e) {
      throw Exception('Failed to fetch Pokemon data: $e');
    }
  }

  @override
  Future<List<FilmEntity>> getStarWarsFilms() async {
    try {
      await checkNetwork(networkInfo);
      return remoteDataSource.getStarWarsFilms();
    } catch (e) {
      throw Exception('Failed to fetch Star Wars films data: $e');
    }
  }
}
checkNetwork(NetworkInfo networkInfo) async {
  if (!(await networkInfo.isConnected)) {
    return Future.error("No Internet Connection");
  }
}

