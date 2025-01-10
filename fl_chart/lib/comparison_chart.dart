import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test/chart_helper.dart';

class ComparisonChart extends StatefulWidget {
  final List<double> primaryData;
  final List<double> secondaryData;
  final List<String> crossAxisLabels;
  final bool showComparison;
  final double? maxY;
  final double? minY;
  final String selectedFilter;

  const ComparisonChart({
    super.key,
    required this.primaryData,
    required this.secondaryData,
    required this.crossAxisLabels,
    required this.selectedFilter,
    this.maxY,
    this.minY,
    this.showComparison = false,
  });

  @override
  State<ComparisonChart> createState() => _ComparisonChartState();
}

class _ComparisonChartState extends State<ComparisonChart> with ChartUtils {
  FlTitlesData get titlesData => FlTitlesData(
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: widget.crossAxisLabels.length / 6,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: AxisSide.bottom,
                child: Text(
                  getTitle(
                      widget.crossAxisLabels, value, widget.selectedFilter),
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              );
            },
          ),
        ),
      );

  List<HorizontalLine> get horizontalLines =>
      generateHorizontalLines(data: widget.primaryData, numberOfLines: 10);

  List<LineChartBarData> get lineBarsData => [
        LineChartBarData(
          spots: generateSpots(widget.primaryData),
          isCurved: true,
          color: Colors.green,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        if (widget.showComparison)
          LineChartBarData(
            spots: generateSpots(widget.secondaryData),
            isCurved: true,
            color: Colors.brown,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
      ];

  LineTouchData get touchData => LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => Colors.white,
          maxContentWidth: 180,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          tooltipRoundedRadius: 8,
          tooltipPadding: const EdgeInsets.all(16),
          getTooltipItems: (touchedSpots) {
            if (touchedSpots.isEmpty) return [];
            final touchedSpot = touchedSpots.first;
            final touchedIndex = touchedSpot.x.toInt();

            final clickedDate = touchedIndex < widget.crossAxisLabels.length
                ? widget.crossAxisLabels[touchedIndex]
                : 'Unknown';

            final primaryValue = touchedSpot.y.toStringAsFixed(2);
            final secondarySpot = touchedSpots.firstWhereOrNull(
              (spot) => spot.barIndex == 1,
            );
            final secondaryValue = secondarySpot?.y.toStringAsFixed(2);

            return [
              getLineTooltipItem(
                clickedDate,
                primaryValue,
                secondaryValue,
                widget.showComparison,
              ),
            ];
          },
        ),
      );

  LineChartData get chartData => LineChartData(
        clipData: const FlClipData.none(),
        maxY: widget.maxY ?? widget.primaryData.reduce(max),
        minY: widget.minY ?? widget.primaryData.reduce(min),
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: true,
          horizontalLines: horizontalLines,
        ),
        gridData: const FlGridData(
          show: true,
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        titlesData: titlesData,
        borderData: FlBorderData(
          show: true,
          border: const Border.symmetric(
            horizontal: BorderSide.none,
            vertical: BorderSide.none,
          ),
        ),
        lineBarsData: lineBarsData,
        lineTouchData: touchData,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(chartData),
    );
  }
}
