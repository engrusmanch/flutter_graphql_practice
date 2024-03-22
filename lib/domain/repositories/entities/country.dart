import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? code;
  final String? name;
  final String? emoji;
  final List<String>? currencies;
  final String? phone;
  final String? capital;
  final List<LanguageEntity>? languages;
  final List<StateEntity>? states;
  final ContinentEntity? continent;

  CountryEntity({
    this.code,
    this.name,
    this.emoji,
    this.currencies,
    this.phone,
    this.capital,
    this.languages,
    this.states,
    this.continent,
  });

  factory CountryEntity.fromJson(Map<String, dynamic> json) {
    return CountryEntity(
      code: json['code'],
      name: json['name'],
      emoji: json['emoji'],
      currencies: (json['currencies'] != null) ? List<String>.from(json['currencies']) : null,
      phone: json['phone'],
      capital: json['capital'],
      languages: (json['languages'] != null)
          ? (json['languages'] as List<dynamic>)
          .map((langJson) => LanguageEntity.fromJson(langJson))
          .toList()
          : null,
      states: (json['states'] != null)
          ? (json['states'] as List<dynamic>)
          .map((stateJson) => StateEntity.fromJson(stateJson))
          .toList()
          : null,
      continent: (json['continent'] != null) ? ContinentEntity.fromJson(json['continent']) : null,
    );
  }

  @override
  List<Object?> get props => [code, name, emoji, currencies, phone, capital, languages, states, continent];
}

class LanguageEntity extends Equatable {
  final String? native;
  final String? name;

  LanguageEntity({
    this.native,
    this.name,
  });

  factory LanguageEntity.fromJson(Map<String, dynamic> json) {
    return LanguageEntity(
      native: json['native'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [native, name];
}

class StateEntity extends Equatable {
  final String? name;

  StateEntity({
    this.name,
  });

  factory StateEntity.fromJson(Map<String, dynamic> json) {
    return StateEntity(
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [name];
}

class ContinentEntity extends Equatable {
  final String? name;

  ContinentEntity({
    this.name,
  });

  factory ContinentEntity.fromJson(Map<String, dynamic> json) {
    return ContinentEntity(
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [name];
}
