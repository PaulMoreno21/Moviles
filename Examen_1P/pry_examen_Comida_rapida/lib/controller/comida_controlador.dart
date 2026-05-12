import '../model/pedido_comida_modelo.dart';

class ComidaControlador {
  dynamic procesarPedido({
    required String cliente,
    required String producto,
    required String combo,
    required String cantidadString,
  }) {
    if (cliente.trim().isEmpty) return "Error: Ingrese el nombre del cliente.";
    if (cantidadString.isEmpty) return "Error: Ingrese la cantidad.";

    final cantidad = int.tryParse(cantidadString);
    if (cantidad == null || cantidad <= 0) {
      return "Error: La cantidad debe ser un número mayor a cero.";
    }

    double precioBase = 0.0;
    if (producto.contains('Hamburguesa')) precioBase = 5.00;
    else if (producto.contains('Salchipapa')) precioBase = 3.50;
    else if (producto.contains('Hot dog')) precioBase = 2.50;

    double valorAdicional = 0.0;
    if (combo.contains('papas')) valorAdicional = 1.50;
    else if (combo.contains('completo')) valorAdicional = 2.50;

    double subtotal = (precioBase + valorAdicional) * cantidad;
    double iva = subtotal * 0.15;
    double total = subtotal + iva;

    return PedidoComidaModelo(
      cliente: cliente,
      producto: producto,
      combo: combo,
      cantidad: cantidad,
      subtotal: subtotal,
      iva: iva,
      total: total,
    );
  }
}
