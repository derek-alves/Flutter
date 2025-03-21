import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineConfig {
  final Color color;
  final bool isCurved;
  final bool isDotted;
  final bool isFilled;
  final List<double> data;

  const LineConfig({
    required this.data,
    required this.color,
    this.isCurved = true,
    this.isDotted = false,
    this.isFilled = false,
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

  LineChartBarData toLineChart() {
    final spots = (data.length == 1)
        ? [FlSpot(1.5, data[0])]
        : data.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value);
          }).toList();
    return LineChartBarData(
      spots: spots,
      color: color,
      isCurved: isCurved,
      dashArray: isDotted ? [5, 5] : null,
      dotData: FlDotData(show: data.length == 1 ? true : false),
      belowBarData: BarAreaData(
        show: isFilled,
        gradient: isFilled
            ? LinearGradient(
                colors: [
                  color.withOpacity(0.5),
                  color.withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
    );
  }
}
