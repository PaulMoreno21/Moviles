
class SueldoModel {

  double calcularSueldo(int edad, int antiguedad) {
    double sumaAntiguedad = 0;
    for (int i = 1; i <= antiguedad; i++) {
      sumaAntiguedad += i;
    }
    return 35000 + edad + (100 * sumaAntiguedad);
  }
}