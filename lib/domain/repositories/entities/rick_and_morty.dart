import 'package:equatable/equatable.dart';

class RickMortyQuery extends Equatable {
  final CharacterInfoEntity? info;
  final List<RickMortyCharacterEntity>? results;

  RickMortyQuery({this.info, this.results});

  factory RickMortyQuery.fromJson(Map<String, dynamic> json) {
    return RickMortyQuery(
      info: json['info'] != null ? CharacterInfoEntity.fromJson(json['info']) : null,
      results: (json['results'] as List<dynamic>?)?.map((characterJson) => RickMortyCharacterEntity.fromJson(characterJson)).toList(),
    );
  }

  @override
  List<Object?> get props => [info, results];
}

class CharacterInfoEntity extends Equatable {
  final int? count;

  CharacterInfoEntity({this.count});

  factory CharacterInfoEntity.fromJson(Map<String, dynamic> json) {
    return CharacterInfoEntity(
      count: json['count'],
    );
  }

  @override
  List<Object?> get props => [count];
}

class RickMortyCharacterEntity extends Equatable {
  final String? name;
  final String? species;
  final String? image;

  RickMortyCharacterEntity({this.name, this.species, this.image});

  factory RickMortyCharacterEntity.fromJson(Map<String, dynamic> json) {
    return RickMortyCharacterEntity(
      name: json['name'],
      species: json['species'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [name, species, image];
}
