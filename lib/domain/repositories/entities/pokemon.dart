import 'package:equatable/equatable.dart';

class PokemonSpeciesQuery extends Equatable {
  final List<Gen1SpeciesEntity>? gen1Species;

  PokemonSpeciesQuery({this.gen1Species});

  factory PokemonSpeciesQuery.fromJson(Map<String, dynamic> json) {
    final gen1SpeciesList = (json['gen1_species'] as List<dynamic>?)
        ?.map((speciesJson) => Gen1SpeciesEntity.fromJson(speciesJson))
        .toList();
    return PokemonSpeciesQuery(gen1Species: gen1SpeciesList);
  }

  @override
  List<Object?> get props => [gen1Species];
}

class Gen1SpeciesEntity extends Equatable {
  final String? name;
  final int? id;
  final List<PokemonEntity>? pokemons;

  Gen1SpeciesEntity({this.name, this.id, this.pokemons});

  factory Gen1SpeciesEntity.fromJson(Map<String, dynamic> json) {
    final pokemonList = (json['pokemon_v2_pokemons'] as List<dynamic>?)
        ?.map((pokemonJson) => PokemonEntity.fromJson(pokemonJson))
        .toList();
    return Gen1SpeciesEntity(
      name: json['name'],
      id: json['id'],
      pokemons: pokemonList,
    );
  }

  @override
  List<Object?> get props => [name, id, pokemons];
}

class PokemonEntity extends Equatable {
  final int? id;
  final String? name;
  final int? height;
  final int? weight;

  PokemonEntity({this.id, this.name, this.height, this.weight});

  factory PokemonEntity.fromJson(Map<String, dynamic> json) {
    return PokemonEntity(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }

  @override
  List<Object?> get props => [id, name, height, weight];
}
