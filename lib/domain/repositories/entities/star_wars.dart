import 'package:equatable/equatable.dart';

class StarWarsQuery extends Equatable {
  final AllFilmsEntity? allFilms;

  StarWarsQuery({this.allFilms});

  factory StarWarsQuery.fromJson(Map<String, dynamic> json) {
    return StarWarsQuery(
      allFilms: json['allFilms'] != null ? AllFilmsEntity.fromJson(json['allFilms']) : null,
    );
  }

  @override
  List<Object?> get props => [allFilms];
}

class AllFilmsEntity extends Equatable {
  final List<FilmEntity>? films;

  AllFilmsEntity({this.films});

  factory AllFilmsEntity.fromJson(Map<String, dynamic> json) {
    return AllFilmsEntity(
      films: (json['films'] as List<dynamic>?)
          ?.map((filmJson) => FilmEntity.fromJson(filmJson))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [films];
}

class FilmEntity extends Equatable {
  final String? title;
  final String? director;
  final String? releaseDate;
  final String? openingCrawl;
  final List<CharacterEntity>? characters;
  final List<String>? producers;

  FilmEntity({
    this.title,
    this.director,
    this.releaseDate,
    this.openingCrawl,
    this.characters,
    this.producers,
  });

  factory FilmEntity.fromJson(Map<String, dynamic> json) {
    return FilmEntity(
      title: json['title'],
      director: json['director'],
      releaseDate: json['releaseDate'],
      openingCrawl: json['openingCrawl'],
      characters: (json['characterConnection']['characters'] as List<dynamic>?)
          ?.map((characterJson) => CharacterEntity.fromJson(characterJson))
          .toList(),
      producers: (json['producers'] as List<dynamic>?)?.map((producer) => producer.toString()).toList(),
    );
  }

  @override
  List<Object?> get props => [title, director, releaseDate, openingCrawl, characters, producers];
}

class CharacterEntity extends Equatable {
  final String? name;

  CharacterEntity({this.name});

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      name: json['name'],
    );
  }

  @override
  String toString() {
    return name!;
  }
  @override
  List<Object?> get props => [name];
}
