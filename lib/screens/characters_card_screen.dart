import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';

class CharacterCardScreen extends StatefulWidget {
  const CharacterCardScreen({super.key});

  @override
  State<CharacterCardScreen> createState() => _CharacterCardScreenState();
}

class _CharacterCardScreenState extends State<CharacterCardScreen> {
  Character? character;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is Character) {
      character = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (character == null) {
      return const Scaffold(
        body: Center(child: Text('No character data')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(character!.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                character!.imageUrl,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),

            _infoRow('Status', character!.status),
            _infoRow('Species', character!.species),
            _infoRow('Gender', character!.gender),
            _infoRow('Location', character!.location),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
