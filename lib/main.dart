import 'package:flutter/material.dart';
import 'package:expense_tracker/WIDGETS/expenses.dart';

var kcolorscheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255,96,59,181));

void main() {
  runApp(
     MaterialApp(
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
          )
      ),
      home: Expenses(),
     )
    
    );
}


