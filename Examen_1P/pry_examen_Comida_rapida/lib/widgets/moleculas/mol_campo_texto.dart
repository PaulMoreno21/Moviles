import 'package:flutter/material.dart';

class MolCampoTexto extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controlador;
  final TextInputType tipoTeclado;

  const MolCampoTexto({
    required this.etiqueta,
    required this.controlador,
    this.tipoTeclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controlador,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          labelText: etiqueta,
        ),
      ),
    );
  }
}
