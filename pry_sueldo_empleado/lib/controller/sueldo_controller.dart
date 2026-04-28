import '../model/sueldo_model.dart';

class SueldoController {
  final _model = SueldoModel();

  String procesarSueldo(String inputEdad, String inputAntiguedad) {
    int? edad = int.tryParse(inputEdad);
    int? antiguedad = int.tryParse(inputAntiguedad);

    if (edad == null || antiguedad == null) {
      return "Ingrese valores numéricos.";
    }
    if (edad < 18) {
      return "La edad debe ser mayor o igual a 18 años.";
    }
    if (antiguedad < 0) {
      return "La antiguedad no puede ser negativa.";
    }
    if (antiguedad > (edad - 18)) {
      return "La Antiguedad  no puede ser mayor que la edad minima.";
    }

    double sueldo = _model.calcularSueldo(edad, antiguedad);

    return "Sueldo semanal: \$${sueldo}";
  }
}