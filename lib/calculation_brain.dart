import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight(Лишний вес)';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight(недостаточно)';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'У вас масса тела выше нормы. Попробуйте заниматся спортом.';
    } else if (_bmi >= 18.5) {
      return 'У вас нормальный вес. Так держать!!!';
    } else {
      return 'У вас масса тела ниже нормы. Кушайте побольше.';
    }
  }
}
