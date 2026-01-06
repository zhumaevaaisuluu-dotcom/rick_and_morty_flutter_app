
import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character.dart';

class CharacterCardsApi{
  
  Future<List<Character>> getCharacterCards() async{
    try{
       final response=await Dio().get(
      'https://rickandmortyapi.com/api/character/');
    final List results=  response.data['results'];
    return results.map((e) => Character(
      id: e['id'],
      name: e['name'],
      status: e['status'],
      species: e['species'],
      imageUrl: e['image'], 
      origin:e['origin']['name'],
      location:e['location']['name'],
      episodes: List<String>.from(e['episode']),
      gender: e['gender'],

      isFavorite: false,
    )).toList();
    }catch (e) {
      throw Exception('Failed to load characters');
    }
  }
}