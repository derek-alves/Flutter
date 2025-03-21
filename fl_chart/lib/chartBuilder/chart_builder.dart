import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test/chartBuilder/chart_builder_helper.dart';
import 'package:test/chartBuilder/line_config.dart';

/// Configuração para uma única linha do gráfico

/// Builder para a construção de uma linha individual do gráfico

/// Widget que monta o gráfico utilizando uma lista de LineBuilder para possibilitar múltiplas linhas
class ChartLine extends StatelessWidget {
  final List<LineConfig> lines;
  final double? targetValue;
  final bool showLabels;
  final String Function(double value)? bottomTitleBuilder;
  final String Function(double value)? leftTitleBuilder;

  const ChartLine({
    super.key,
    required this.lines,
    this.bottomTitleBuilder,
    this.leftTitleBuilder,
    this.targetValue,
    this.showLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    final initializer = ChartInitializer(
      lines: lines,
      target: targetValue,
    );

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          clipData: const FlClipData.vertical(),
          maxX: initializer.axis.maxX,
          minX: initializer.axis.minX,
          maxY: initializer.axis.maxY,
          minY: initializer.axis.minY,
          gridData: const FlGridData(
            drawHorizontalLine: false,
            drawVerticalLine: false,
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(),
            leftTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            bottomTitles: showLabels
                ? AxisTitles(
                    axisNameSize: 38,
                    sideTitles: initializer.widget.getSideTitlesFromPerformance(
                      size: initializer.size,
                      textStyle: const TextStyle(),
                      bottomTitleBuilder: bottomTitleBuilder,
                    ),
                    axisNameWidget: initializer.widget.getAxiesNameWidget(
                      size: initializer.size,
                      textStyle: const TextStyle(),
                      bottomTitleBuilder: bottomTitleBuilder,
                    ),
                  )
                : const AxisTitles(),
          ),
          extraLinesData: showLabels
              ? ExtraLinesData(
                  horizontalLines: initializer.widget.generateHorizontalLines(
                    data: initializer.yValues,
                    target: targetValue,
                    lineColor: Colors.black,
                    lineColorActive: Colors.grey,
                  ),
                )
              : const ExtraLinesData(),
          borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(),
          ),
          lineBarsData: lines
              .map(
                (lineBuilder) => lineBuilder.toLineChart(),
              )
              .toList(),
        ),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
