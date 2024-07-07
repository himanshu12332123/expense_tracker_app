import 'package:flutter/material.dart';
import 'package:expense_tracker/WIDGETS/expenses.dart';

var kcolorscheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255,96,59,181));

var kdarkcolorscheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125) 
  );
void main() {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kdarkcolorscheme,

          cardTheme: CardTheme().copyWith(
          color: kdarkcolorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkcolorscheme.primaryContainer,
          )
          ),
      ),
      theme: ThemeData.light().copyWith(
        colorScheme: kcolorscheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kcolorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorscheme.primaryContainer,
          )
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(fontWeight: FontWeight.bold,
            color: kcolorscheme.onSecondaryContainer,
            fontSize: 16,
            )
          )
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
     )
    
    );
}


