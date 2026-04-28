import 'package:flutter/material.dart';
import '../controller/sueldo_controller.dart';

// --- ÁTOMOS ---
class label extends StatelessWidget {
  final String text;
  label(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(fontSize: 20));
}

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  NumberField({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder()
    ),
  );
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// --- MOLÉCULA ---
class DatosEmpleadoInput extends StatelessWidget {
  final TextEditingController edadC, antiguedadC;

  DatosEmpleadoInput({super.key, required this.edadC, required this.antiguedadC});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: NumberField(controller: edadC, hint: 'Edad')),
        SizedBox(width: 10,),
        Expanded(child: NumberField(controller: antiguedadC, hint: 'Antiguedad')),
      ],
    );
  }
}

// --- ORGANISMO ---
class SueldoCard extends StatefulWidget {
  SueldoCard({super.key});

  @override
  State<StatefulWidget> createState() => _SueldoCardState();
}

class _SueldoCardState extends State<SueldoCard> {
  final _ctrlEdad = TextEditingController();
  final _ctrlAntiguedad = TextEditingController();
  String _resultado = '';

  final _controller = SueldoController();

  void _calcular() {
    setState(() {
      _resultado = _controller.procesarSueldo(_ctrlEdad.text, _ctrlAntiguedad.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            label("Cálculo de Sueldo Semanal XYZ"),
            SizedBox(height: 15,),
            DatosEmpleadoInput(edadC: _ctrlEdad, antiguedadC: _ctrlAntiguedad),
            SizedBox(height: 15,),
            PrimaryButton(text: "Calcular Sueldo", onPressed: _calcular),
            SizedBox(height: 15,),
            label(_resultado),
          ],
        ),
      ),
    );
  }
}

class SueldoPage extends StatelessWidget {
  SueldoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sueldos XYZ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SueldoCard(),
      ),
    );
  }
}