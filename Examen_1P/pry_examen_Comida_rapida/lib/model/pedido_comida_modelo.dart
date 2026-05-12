class PedidoComidaModelo {
  final String cliente;
  final String producto;
  final String combo;
  final int cantidad;
  final double subtotal;
  final double iva;
  final double total;


  PedidoComidaModelo({
    required this.cliente,
    required this.producto,
    required this.combo,
    required this.cantidad,
    required this.subtotal,
    required this.iva,
    required this.total,
  });
}