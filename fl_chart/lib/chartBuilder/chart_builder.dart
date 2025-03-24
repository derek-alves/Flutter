// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test/chartBuilder/chart_builder_helper.dart';
import 'package:test/chartBuilder/chart_config.dart';
import 'package:test/chartBuilder/line_config.dart';

abstract class Chart extends StatelessWidget {
  factory Chart.line({
    Key? key,
    required List<LineConfig> lines,
    double? targetValue,
    bool showLabels = false,
    String Function(double value)? bottomTitleBuilder,
    String Function(double value)? rightTitleBuilder,
  }) {
    return ChartLine(
      key: key,
      lines: lines,
      targetValue: targetValue,
      showLabels: showLabels,
      bottomTitleBuilder: bottomTitleBuilder,
      rightTitleBuilder: rightTitleBuilder,
    );
  }
}

class ChartLine extends StatelessWidget implements Chart {
  final List<LineConfig> lines;
  final double? targetValue;
  final bool showLabels;
  final String Function(double value)? bottomTitleBuilder;
  final String Function(double value)? rightTitleBuilder;

  const ChartLine({
    super.key,
    required this.lines,
    this.targetValue,
    this.showLabels = false,
    this.bottomTitleBuilder,
    this.rightTitleBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final initializer = ChartInitializer(
      lines: lines,
      target: targetValue,
    );

    final axisData = initializer.axis;

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: LineChart(
        _buildChartData(initializer, axisData),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  LineChartData _buildChartData(
      ChartInitializer initializer, AxisConfiguration axisData) {
    return LineChartData(
      clipData: const FlClipData.vertical(),
      maxX: axisData.maxX,
      minX: axisData.minX,
      maxY: axisData.maxY,
      minY: axisData.minY,
      gridData: const FlGridData(
        drawHorizontalLine: false,
        drawVerticalLine: false,
      ),
      titlesData: _buildTitlesData(initializer),
      extraLinesData: _buildExtraLinesData(initializer),
      borderData: FlBorderData(
        show: true,
        border: const Border.symmetric(),
      ),
      lineBarsData:
          lines.map((lineBuilder) => lineBuilder.toLineChart()).toList(),
    );
  }

  FlTitlesData _buildTitlesData(ChartInitializer initializer) {
    return FlTitlesData(
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
    );
  }

  ExtraLinesData _buildExtraLinesData(ChartInitializer initializer) {
    if (showLabels) {
      return ExtraLinesData(
        horizontalLines: initializer.widget.generateHorizontalLines(
          data: initializer.yValues,
          target: targetValue,
          lineColor: Colors.black,
          lineColorActive: Colors.grey,
          rightTitleBuilder: rightTitleBuilder,
        ),
      );
    }
    return const ExtraLinesData();
  }
}
