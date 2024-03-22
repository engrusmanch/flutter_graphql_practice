
import 'package:equatable/equatable.dart';

class AniListEntity extends Equatable {
  final String? siteUrl;
  final TitleEntity? title;
  final String? description;
  final List<CharacterEntity>? characters;

  AniListEntity({
    this.siteUrl,
    this.title,
    this.description,
    this.characters,
  });

  factory AniListEntity.fromJson(Map<String, dynamic> json) {
    return AniListEntity(
      siteUrl: json['siteUrl'],
      title: json['title'] != null ? TitleEntity.fromJson(json['title']) : null,
      description: json['description'],
      characters: json['characters'] != null
          ? (json['characters']['nodes'] as List<dynamic>)
          .map((charJson) => CharacterEntity.fromJson(charJson))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'siteUrl': siteUrl,
      'title': title?.toJson(),
      'description': description,
      'characters': characters?.map((char) => char.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [siteUrl, title, description, characters];
}

class TitleEntity extends Equatable {
  final String? english;
  final String? native;

  TitleEntity({
    this.english,
    this.native,
  });

  factory TitleEntity.fromJson(Map<String, dynamic> json) {
    return TitleEntity(
      english: json['english'],
      native: json['native'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english': english,
      'native': native,
    };
  }

  @override
  List<Object?> get props => [english, native];
}

class CharacterEntity extends Equatable {
  final ImageEntity? image;

  CharacterEntity({
    this.image,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity(
      image: json['image'] != null ? ImageEntity.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image?.toJson(),
    };
  }

  @override
  List<Object?> get props => [image];
}

class ImageEntity extends Equatable {
  final String? large;

  ImageEntity({
    this.large,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(
      large: json['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'large': large,
    };
  }

  @override
  List<Object?> get props => [large];
}
