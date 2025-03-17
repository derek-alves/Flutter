import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Configuração do gráfico, agora incluindo os pontos de dados
class ChartConfig {
  final Color color;
  final bool isCurved;
  final bool isDotted;
  final bool isFilled;
  final List<FlSpot> data;

  const ChartConfig({
    required this.color,
    this.isCurved = false,
    this.isDotted = false,
    this.isFilled = false,
    this.data = const [],
  });

  /// Permite criar uma nova configuração com algumas propriedades alteradas
  ChartConfig copyWith({
    Color? color,
    bool? isCurved,
    bool? isDotted,
    bool? isFilled,
    List<FlSpot>? data,
  }) {
    return ChartConfig(
      color: color ?? this.color,
      isCurved: isCurved ?? this.isCurved,
      isDotted: isDotted ?? this.isDotted,
      isFilled: isFilled ?? this.isFilled,
      data: data ?? this.data,
    );
  }
}

/// Builder para o gráfico utilizando FLChart
class ChartBuilder {
  final ChartConfig config;

  ChartBuilder({ChartConfig? config})
      : config = config ?? const ChartConfig(color: Colors.blue);

  /// Define a cor do gráfico
  ChartBuilder color(Color newColor) {
    return ChartBuilder(config: config.copyWith(color: newColor));
  }

  /// Define que a linha será curva
  ChartBuilder curved() {
    return ChartBuilder(config: config.copyWith(isCurved: true));
  }

  /// Define que a linha será pontilhada
  ChartBuilder dotted() {
    return ChartBuilder(config: config.copyWith(isDotted: true));
  }

  /// Define que a área abaixo da linha será preenchida com um gradiente
  ChartBuilder filled() {
    return ChartBuilder(config: config.copyWith(isFilled: true));
  }

  /// Adiciona os pontos de dados ao gráfico
  /// Adiciona os pontos de dados ao gráfico a partir de uma lista de valores Y
  ChartBuilder data(List<double> values) {
    final List<FlSpot> spots = values.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value);
    }).toList();

    return ChartBuilder(config: config.copyWith(data: spots));
  }

  /// Monta o widget do gráfico com base nas configurações e nos dados
  Widget build() {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: config.data,
              color: config.color,
              isCurved: config.isCurved,
              dashArray: config.isDotted ? [5, 5] : null,
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
            ),
          ],
        ),
      ),
    );
  }
}
