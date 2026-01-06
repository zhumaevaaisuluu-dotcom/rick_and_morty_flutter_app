import 'package:flutter/material.dart';

final whitetheme = ThemeData(
        primarySwatch: Colors.deepPurple,
        dividerColor: Colors.black26,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.grey,
        ),
        textTheme: TextTheme(
          bodyMedium:const TextStyle(fontSize: 18.0, color: Colors.black87),
          labelSmall: const TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
          
      );