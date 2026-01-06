import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/favorites_store.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}
class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoriteStore.favorites; // Replace with actual favorite characters list
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Characters'),
      ),
      body: favorites.isEmpty
      ?const Center(child: Text('No favorite characters added yet.'))
      :ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final character = favorites[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(character.imageUrl),
            ),
            title: Text(character.name),
            subtitle: Text('${character.species} • ${character.status}'),
            trailing: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                setState(() {
                  FavoriteStore.removeFavorite(character);
                });
              },
            ),
          );

        },
      ));

  }
}