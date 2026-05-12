import 'package:flutter/material.dart';
import 'esquema_color.dart';
class TemaAppBar {

  static const AppBarTheme estilo = AppBarTheme(
  backgroundColor: ColoresApp.primario,
    foregroundColor: ColoresApp.textoClaro,
    centerTitle: true,
    elevation: 3,
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: ColoresApp.textoClaro
    ),
  );
}