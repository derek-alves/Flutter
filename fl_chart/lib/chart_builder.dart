import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Configuração para uma única linha do gráfico
class LineConfig {
  final Color color;
  final bool isCurved;
  final bool isDotted;
  final bool isFilled;
  final List<FlSpot> data;

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
    List<FlSpot>? data,
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
    final List<FlSpot> spots = values.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value);
    }).toList();

    return LineBuilder(config: config.copyWith(data: spots));
  }

  /// Constrói o objeto LineChartBarData com base na configuração
  LineChartBarData build() {
    return LineChartBarData(
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
    );
  }
}

/// Widget que monta o gráfico utilizando uma lista de LineBuilder para possibilitar múltiplas linhas
class ChartLine extends StatelessWidget {
  final List<LineBuilder> lines;

  const ChartLine({super.key, required this.lines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          lineBarsData:
              lines.map((lineBuilder) => lineBuilder.build()).toList(),
        ),
      ),
    );
  }
}
