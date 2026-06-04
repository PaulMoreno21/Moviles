import '../../domain/entities/character.dart';
import '../datasource/rickandmorty_datasource.dart';

class CharacterRepositoryImpl {
  //instaciamos
  final RickAndMortyDatasource datasource;

  CharacterRepositoryImpl(this.datasource);

  Future<List<Character>> getCharacters({int page = 1}) async {
    return datasource.fetchCharacters(page: page);
  }
}
