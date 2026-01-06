
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/services/favorites_store.dart';

class CharacterCardTile extends StatefulWidget {
  const CharacterCardTile({
    super.key,
    required this.card,
  });

  final Character card;

  @override
  State<CharacterCardTile> createState() => _CharacterCardTileState();
}

class _CharacterCardTileState extends State<CharacterCardTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFavorite = FavoriteStore.isFavorite(widget.card);
    return ListTile(
            leading: Image.network(widget.card.imageUrl),
      title: Text(
        widget.card.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        widget.card.species,
        style: theme.textTheme.labelSmall,
      ),
      trailing: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          setState(() {
            FavoriteStore.toggleFavorite(widget.card);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isFavorite
                    ? '${widget.card.name} removed from favorites'
                    : '${widget.card.name} added to favorites',
              ),
            ),
          );
        },
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/characterDetails',
          arguments: widget.card,
        );
      },
    );
  }
}


