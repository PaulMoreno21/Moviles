import 'package:flutter/material.dart';
import '../controller/comida_controlador.dart';
import '../model/pedido_comida_modelo.dart';
import '../widgets/atomos/atom_button.dart';
import '../widgets/moleculas/mol_campo_texto.dart';
import '../widgets/moleculas/mol_selector.dart';

class VistaComidaRapida extends StatefulWidget {
  @override
  State<VistaComidaRapida> createState() => _VistaComidaRapidaState();
}

class _VistaComidaRapidaState extends State<VistaComidaRapida> {
  final ComidaControlador _controlador = ComidaControlador();

  final _clienteInput = TextEditingController();
  final _cantidadInput = TextEditingController();

  String _productoSeleccionado = 'Hamburguesa (\$5.00)';
  String _comboSeleccionado = 'Solo producto (\$0.00)';

  void _procesarPedido() {
    final resultado = _controlador.procesarPedido(
      cliente: _clienteInput.text,
      producto: _productoSeleccionado,
      combo: _comboSeleccionado,
      cantidadString: _cantidadInput.text,
    );

    if (resultado is String) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resultado)));
    } else if (resultado is PedidoComidaModelo) {
      Navigator.pushNamed(context, '/notaVentaComida', arguments: resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedido Comida Rápida')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MolCampoTexto(etiqueta: "Nombre del Cliente", controlador: _clienteInput),

            MolSelector(
              etiqueta: "Producto",
              valorActual: _productoSeleccionado,
              opciones: const [
                'Hamburguesa (\$5.00)', 
                'Salchipapa (\$3.50)', 
                'Hot dog (\$2.50)'
              ],
              alCambiar: (val) => setState(() => _productoSeleccionado = val!),
            ),

            MolSelector(
              etiqueta: "Tipo de Combo",
              valorActual: _comboSeleccionado,
              opciones: const [
                'Solo producto (\$0.00)', 
                'Combo con papas (\$1.50)', 
                'Combo completo (\$2.50)'
              ],
              alCambiar: (val) => setState(() => _comboSeleccionado = val!),
            ),

            MolCampoTexto(
                etiqueta: "Cantidad",
                controlador: _cantidadInput,
                tipoTeclado: TextInputType.number
            ),

            const SizedBox(height: 20),
            AtomBoton(texto: "Generar Nota de Venta", onPressed: _procesarPedido),
          ],
        ),
      ),
    );
  }
}
