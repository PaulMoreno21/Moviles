import 'package:flutter/material.dart';
import '../../model/pedido_comida_modelo.dart';

class OrgNotaVentaComida extends StatelessWidget {
  final PedidoComidaModelo pedido;

  const OrgNotaVentaComida({required this.pedido});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      color: theme.cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "FAST FOOD STORE",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                )
            ),
            const Divider(),
            Text("Cliente: ${pedido.cliente}", style: theme.textTheme.bodyMedium),
            Text("Producto: ${pedido.producto} (${pedido.combo})", style: theme.textTheme.bodyMedium),
            Text("Cantidad: ${pedido.cantidad}", style: theme.textTheme.bodyMedium),

            const SizedBox(height: 20),

            Text("Subtotal: \$${pedido.subtotal.toStringAsFixed(2)}", style: theme.textTheme.bodyMedium),
            Text("IVA (15%): \$${pedido.iva.toStringAsFixed(2)}", style: theme.textTheme.bodyMedium),

            const Divider(),

            Text(
                "TOTAL A PAGAR: \$${pedido.total.toStringAsFixed(2)}",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )
            ),
          ],
        ),
      ),
    );
  }
}
