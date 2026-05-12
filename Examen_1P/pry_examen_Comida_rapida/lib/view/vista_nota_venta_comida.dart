import 'package:flutter/material.dart';
import '../model/pedido_comida_modelo.dart';
import '../widgets/atomos/atom_button.dart';
import '../widgets/organismos/org_nota_venta_comida.dart';
class VistaNotaVentaComida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pedido = ModalRoute.of(context)!.settings.arguments as PedidoComidaModelo;

    return Scaffold(
      appBar: AppBar(title: const Text("Nota de Venta")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              OrgNotaVentaComida(pedido: pedido),

              const SizedBox(height: 30),

              AtomBoton(
                texto: "Volver al Inicio",
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}