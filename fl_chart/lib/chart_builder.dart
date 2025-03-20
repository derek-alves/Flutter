import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test/chart_builder_helper.dart';

/// Configuração para uma única linha do gráfico
class LineConfig {
  final Color color;
  final bool isCurved;
  final bool isDotted;
  final bool isFilled;
  final List<double> data;

  const LineConfig({
    required this.color,
    this.isCurved = false,
    this.isDotted = false,
    this.isFilled = false,
    this.data = const [],
  });

  /// Permite criar uma nova configuração com algumas propriedades alteradas
  LineConfig copyWith({
    Color? color,
    bool? isCurved,
    bool? isDotted,
    bool? isFilled,
    List<double>? data,
  }) {
    return LineConfig(
      color: color ?? this.color,
      isCurved: isCurved ?? this.isCurved,
      isDotted: isDotted ?? this.isDotted,
      isFilled: isFilled ?? this.isFilled,
      data: data ?? this.data,
    );
  }
}

/// Builder para a construção de uma linha individual do gráfico
class LineBuilder {
  final LineConfig config;

  LineBuilder({LineConfig? config})
      : config = config ?? const LineConfig(color: Colors.blue);

  /// Define a cor da linha
  LineBuilder color(Color newColor) {
    return LineBuilder(config: config.copyWith(color: newColor));
  }

  /// Define que a linha será curva
  LineBuilder curved() {
    return LineBuilder(config: config.copyWith(isCurved: true));
  }

  /// Define que a linha será pontilhada
  LineBuilder dotted() {
    return LineBuilder(config: config.copyWith(isDotted: true));
  }

  /// Define que a área abaixo da linha será preenchida
  LineBuilder filled() {
    return LineBuilder(config: config.copyWith(isFilled: true));
  }

  /// Adiciona os pontos de dados à linha a partir de uma lista de valores Y
  LineBuilder data(List<double> values) {
    return LineBuilder(config: config.copyWith(data: values));
  }

  /// Constrói o objeto LineChartBarData com base na configuração
  LineChartBarData build() {
    final spots = (config.data.length == 1)
        ? [FlSpot(1.5, config.data[0])]
        : config.data.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value);
          }).toList();

    return LineChartBarData(
      spots: spots,
      color: config.color,
      isCurved: config.isCurved,
      dashArray: config.isDotted ? [5, 5] : null,
      dotData: FlDotData(show: config.data.length == 1 ? true : false),
      belowBarData: BarAreaData(
        show: config.isFilled,
        gradient: config.isFilled
            ? LinearGradient(
                colors: [
                  config.color.withOpacity(0.5),
                  config.color.withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
    );
  }
}

/// Widget que monta o gráfico utilizando uma lista de LineBuilder para possibilitar múltiplas linhas
class ChartLine extends StatelessWidget with ChartBuilderHelper {
  final List<LineBuilder> lines;
  final double? targetValue;
  final bool showLabels;
  final String Function(double value)? bottomTitleBuilder;
  final String Function(double value)? leftTitleBuilder;

  ChartLine({
    super.key,
    required this.lines,
    this.bottomTitleBuilder,
    this.leftTitleBuilder,
    this.targetValue,
    this.showLabels = false,
  });

  @override
  Widget build(BuildContext context) {
    final (
      :yMax,
      :yMin,
      :yAxisValues,
      :xMax,
      :xMin,
      :maxItems,
    ) = getDynamicAxisFromPerformances(
      lines: lines,
      target: targetValue,
    );

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          clipData: const FlClipData.vertical(),
          maxX: xMax,
          minX: xMin,
          maxY: yMax,
          minY: yMin,
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
                    sideTitles: getSideTitlesFromPerformance(
                      size: maxItems,
                      textStyle: const TextStyle(),
                      bottomTitleBuilder: bottomTitleBuilder,
                    ),
                    axisNameWidget: getAxiesNameWidget(
                      size: maxItems,
                      textStyle: const TextStyle(),
                      bottomTitleBuilder: bottomTitleBuilder,
                    ),
                  )
                : const AxisTitles(),
          ),
          extraLinesData: showLabels
              ? ExtraLinesData(
                  horizontalLines: generateHorizontalLines(
                    data: yAxisValues,
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
          lineBarsData:
              lines.map((lineBuilder) => lineBuilder.build()).toList(),
        ),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  List<HorizontalLine> generateHorizontalLines({
    required List<double> data,
    required double? target,
    required Color lineColor,
    required Color lineColorActive,
    String Function(double value)? leftTitleBuilder,
  }) {
    if (data.isEmpty) return [];

    return data
        .map(
          (value) => HorizontalLine(
            y: value,
            color: target == value ? lineColorActive : lineColor,
            strokeWidth: 0.8,
            label: HorizontalLineLabel(
              show: true,
              alignment: Alignment.topRight,
              padding: EdgeInsets.zero,
              labelResolver: (line) {
                return leftTitleBuilder == null
                    ? line.y.toString()
                    : leftTitleBuilder(line.y);
              },
            ),
          ),
        )
        .toList();
  }
}
