// Example usage
import 'package:flutter/material.dart';
import 'package:test/chartBuilder/chart_builder.dart';
import 'package:test/chartBuilder/chart_custom_touch_config.dart';
import 'package:test/chartBuilder/line_config.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chart.line(
            targetValue: 2,
            showLabels: true,
            customLineTouchData: CustomLineTouchData(
              onTouchCallback: (x, y) {
                print('Eixo X: $x, Eixo Y: $y');
              },
            ),
            rightTitleBuilder: (value) => value.toStringAsFixed(2),
            lines: const [
              LineConfig(
                color: Colors.green,
                data: [1],
              ),
              LineConfig(
                color: Colors.red,
                data: [1, 2, 3, 1, 5, 4],
                isFilled: true,
              ),
              LineConfig(
                color: Colors.black,
                data: [7, 3, 1, 3, 5, 8],
                isDotted: true,
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
// Função para calcular o MDC (máximo divisor comum) de dois números inteiros.
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:test/home_page.dart';

double gcd(double a, double b) {
  a = a.abs();
  b = b.abs();
  while (b != 0) {
    double temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

/// Gera uma sequência de números com incremento fixo, onde:
/// - A sequência se estende a partir do [target] para baixo, até o maior valor que não seja menor que [min],
///   e para cima, até o menor valor que não ultrapasse [max].
/// - O incremento usado é o mesmo dos dois lados.
/// - A quantidade total de itens não excede [maxItems].
// List<double> generateSequence(
//   double minValue,
//   double target,
//   double maxValue, {
//   int maxItems = 10,
// }) {
//   var gapMin = target - minValue;
//   var gapMax = maxValue - target;
//   // Escolhe o índice T (entre 1 e n-2, ou seja, 1 e 8) onde ficará o target.
//   // Uma forma de balancear é:
//   int targetIndex = ((maxItems - 1) * gapMin / (gapMin + gapMax)).round();
//   // Garante que target esteja entre 1 e 8
//   targetIndex = max(1, min(targetIndex, maxItems - 2));

//   double minDiff = (target - minValue) / targetIndex;
//   double maxDiff = (maxValue - target) / (maxItems - 1 - targetIndex);

//   double step = max(minDiff, maxDiff);

//   final double epsilon = target * 0.001;
//   step += epsilon;

//   double fisrtValue = target - targetIndex * step;

//   List<double> resultado =
//       List.generate(maxItems, (i) => fisrtValue + i * step);

//   return resultado;
// }

// void main() {
//   double min = 933;
//   double target = 1000;
//   double max = 1000;

//   List<double> result = generateSequence(
//     min,
//     target,
//     max,
//   );

//   print(result); // Deve imprimir: [900, 1000, 1100, 1200, 1300, 1400, 1500]
// }
