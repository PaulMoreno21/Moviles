import 'package:flutter/material.dart';
import 'temas/index.dart';
import 'view/vista_comida_rapida.dart';
import 'view/vista_nota_venta_comida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedido Comida Rápida',
      theme: TemaGeneral.claro,
      initialRoute: '/comida',
      routes: {
        '/comida': (context) => VistaComidaRapida(),
        '/notaVentaComida': (context) => VistaNotaVentaComida(),
      },
    );
  }
}
