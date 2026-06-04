import '../entities/character.dart';
import '../../data/repositories/character_repository_impl.dart';

class GetCharactersUsecase {
  final CharacterRepositoryImpl repository;

  GetCharactersUsecase(this.repository);

  Future<List<Character>> call({int page = 1}) {
    return repository.getCharacters(page: page);
  }
}
