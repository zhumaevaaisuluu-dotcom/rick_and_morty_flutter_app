import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters_card_screen.dart';
import 'package:rick_and_morty/screens/characters_list_screen.dart';
import 'package:rick_and_morty/screens/main_screen.dart';
import 'package:rick_and_morty/theme/theme.dart';

void main() {
  runApp(const CharactersScreen());
}

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty ',
      theme: whitetheme,
      debugShowCheckedModeBanner: false,
      routes:{
        
        '/':(context) => const CharactersListScreen(),
        '/main':(context) => const MainScreen(),
        '/characterDetails': (context) => const CharacterCardScreen(),
      },
   );
  }
}
