import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/character_model.dart';

class RickAndMortyDatasource {
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  Future<List<CharacterModel>> fetchCharacters({int page = 1}) async {
    final url = Uri.parse("$baseUrl?page=$page");

    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception("Error al cargar personajes");
    }

    final data = jsonDecode(resp.body);
    final List results = data["results"];

    return results.map((e) => CharacterModel.fromJson(e)).toList();
  }
}
