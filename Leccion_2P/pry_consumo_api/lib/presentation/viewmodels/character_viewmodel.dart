import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters_usecase.dart';

class CharacterViewModel extends ChangeNotifier {
  final GetCharactersUsecase getCharactersUsecase;

  CharacterViewModel(this.getCharactersUsecase);

  List<Character> characters = [];
  bool loading = false;
  bool isFetchingMore = false;
  int _currentPage = 1;
  String? errorMessage;

  Future<void> loadCharacters() async {
    loading = true;
    errorMessage = null;
    _currentPage = 1;
    notifyListeners();
    try {
      characters = await getCharactersUsecase(page: _currentPage);
    } catch (e) {
      errorMessage = "Error al cargar los personajes";
    }
    loading = false;
    notifyListeners();
  }

  Future<void> loadNextPage() async {
    if (isFetchingMore || loading) return;
    
    isFetchingMore = true;
    notifyListeners();
    
    try {
      _currentPage++;
      final nextCharacters = await getCharactersUsecase(page: _currentPage);
      characters.addAll(nextCharacters);
    } catch (e) {
      _currentPage--; 
    } finally {
      isFetchingMore = false;
      notifyListeners();
    }
  }
}
