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
  final double chartHeight;

  const MeterChart({
    super.key,
    required this.meterData,
    required this.baseColor,
    this.chartHeight = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: chartHeight,
      width: double.infinity,
      child: CustomPaint(
        painter: MeterChartPainter(
          meterData: meterData,
          baseColor: baseColor,
        ),
      ),
    );
  }
}
