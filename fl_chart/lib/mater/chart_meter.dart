import 'package:flutter/material.dart';
import 'package:test/mater/chart_meter_painter.dart';

/// Dados usados para configurar o gráfico (apenas a porcentagem ou valor de cada segmento).
class MeterDataConfig {
  final double value;

  MeterDataConfig({required this.value});
}

/// Dados de exibição para cada item abaixo do gráfico.
class MeterChartItemData {
  final String leftTitle;
  final String rightTitle;
  final String leftDescription;
  final String rightDescription;
  final VoidCallback? onTap;

  MeterChartItemData({
    required this.leftTitle,
    required this.rightTitle,
    required this.leftDescription,
    required this.rightDescription,
    this.onTap,
  });
}

class MeterChart extends StatelessWidget {
  final List<MeterDataConfig> meterData;
  final MaterialColor baseColor;
  final Duration duration;
  final Curve curve;
  final double height;

  const MeterChart({
    super.key,
    required this.meterData,
    required this.baseColor,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeOut,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, progress, child) {
        return SizedBox(
          height: height,
          width: double.infinity,
          child: CustomPaint(
            painter: MeterChartPainter(
              meterData: meterData,
              baseColor: baseColor,
              progress: progress,
            ),
          ),
        );
      },
    );
  }
}
