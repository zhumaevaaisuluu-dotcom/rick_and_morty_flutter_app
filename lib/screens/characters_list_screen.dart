
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/screens/favorites_screen.dart';
import 'package:rick_and_morty/services/api_service.dart';
import 'package:rick_and_morty/widgets/character_card.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  List<Character> _charactersList = [];
  bool isLoading = true;
  int currentIndex = 0;



  @override
  void initState() {
    super.initState();
    
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    final characters = await CharacterCardsApi().getCharacterCards();
    setState(() {
      _charactersList = characters;
      isLoading = false;
    });
  }

  Widget _buildCharactersList() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemCount: _charactersList.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return CharacterCardTile(card: _charactersList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty Characters')),
      body: currentIndex == 0
        ? _buildCharactersList()
        : const FavoritesScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
