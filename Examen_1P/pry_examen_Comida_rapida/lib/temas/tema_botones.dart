import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaBotones {
  //boton Principal
  static final  botonPrincipal = ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       backgroundColor: ColoresApp.primario,
       foregroundColor: ColoresApp.textoClaro,
       padding: EdgeInsets.symmetric(
         horizontal: 32,
         vertical: 14
       ),
       shape: RoundedRectangleBorder(
         borderRadius:BorderRadius.circular(10)
       ),
       textStyle: TextStyle(fontWeight: FontWeight.bold)
     )
  );
  //boton secundario
static final botonSecundario = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor:  ColoresApp.secundario,
    side: BorderSide(color: ColoresApp.primario),
    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),

  )
);

}