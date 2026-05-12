import 'package:flutter/material.dart';

class AtomBoton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const AtomBoton({required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}
