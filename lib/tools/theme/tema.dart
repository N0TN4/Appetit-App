import 'package:flutter/material.dart';

import 'colors_app.dart';

class Tema {
  static TextTheme texto = new TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: ColorsApp.corPrimaria,
    ),
    headline3: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black45,
    ),
  );
  static InputDecorationTheme inputTema = InputDecorationTheme(
    // labelStyle: TextStyle(height: 0.0, color: Colors.grey),
    hintStyle: TextStyle(height: 0, color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    isDense: false,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: ColorsApp.corPrimaria, width: 2),
    ),
    filled: true,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: ColorsApp.corPrimaria, width: 1),
    ),
  );
  static IconThemeData iconesTema = IconThemeData(color: ColorsApp.corPrimaria);
}
