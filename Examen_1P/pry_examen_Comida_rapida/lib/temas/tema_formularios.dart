import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaFormularios{
 static final camposTexto = InputDecorationTheme(
   filled: true,
   fillColor: Colors.white,
   labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
   floatingLabelStyle: const TextStyle(color: ColoresApp.primario, fontWeight: FontWeight.bold),
   prefixIconColor: ColoresApp.primario,
   enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(10),
     borderSide: BorderSide(color: Colors.black45),
   ),
   focusedBorder: OutlineInputBorder(
     borderRadius: BorderRadius.circular(10),
     borderSide: BorderSide(color: ColoresApp.primario, width: 4)
   ),
 );
}