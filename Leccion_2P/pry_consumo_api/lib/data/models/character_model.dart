import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  CharacterModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.status,
    required super.species,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      status: json['status'],
      species: json['species'],
    );
  }
}
