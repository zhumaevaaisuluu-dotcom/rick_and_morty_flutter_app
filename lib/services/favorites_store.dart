import 'package:rick_and_morty/models/character.dart';

class FavoriteStore {
  static final List<Character> favorites = [];

  static void addFavorite(Character character) {
    if (!favorites.any((c) => c.id == character.id)) {
      favorites.add(character);
    }
  }

  static void removeFavorite(Character character) {
    favorites.removeWhere((c) => c.id == character.id);
  }

  static bool isFavorite(Character character) {
    return favorites.any((c) => c.id == character.id);
  }

  static void toggleFavorite(Character character) {
    if (isFavorite(character)) {
      removeFavorite(character);
    } else {
      addFavorite(character);
    }
  }
}
