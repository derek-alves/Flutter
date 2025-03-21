import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AxisData {
  final double maxX;
  final double maxY;
  final double minY;
  final double minX;
  final int maxItems;

  AxisData({
    required this.maxX,
    required this.maxY,
    required this.minY,
    required this.minX,
    required this.maxItems,
  });
}

class ChartConfiguration {
  final int maxItems;
  final List<double> yValues;
  final AxisConfiguration axis;
  final WidgetConfiguration widget;

  ChartConfiguration({
    required this.axis,
    required this.maxItems,
    required this.yValues,
    required this.widget,
  });
}

class AxisConfiguration {
  final double maxX;
  final double maxY;
  final double minY;
  final double minX;
  AxisConfiguration({
    required this.maxX,
    required this.maxY,
    required this.minY,
    required this.minX,
  });
}

class WidgetConfiguration {
  SideTitles getSideTitlesFromPerformance({
    required int size,
    required TextStyle textStyle,
    required String Function(double value)? bottomTitleBuilder,
  }) {
    if (size > 1) {
      return const SideTitles();
    }

    const middleValue = '1.5';

    return SideTitles(
      reservedSize: 38,
      getTitlesWidget: (value, meta) {
        if (value.toStringAsFixed(1) == middleValue) {
          return Text(
            bottomTitleBuilder != null
                ? bottomTitleBuilder(value)
                : value.toStringAsFixed(1),
            style: textStyle,
          );
        }
        return const SizedBox();
      },
      showTitles: true,
    );
  }

  Widget? getAxiesNameWidget({
    required int size,
    required TextStyle textStyle,
    required String Function(double value)? bottomTitleBuilder,
  }) {
    const maxSize = 5;
    final hasEnoughSize = size > 1;

    if (hasEnoughSize) {
      final performanceSize = size < maxSize ? size : maxSize;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(performanceSize.toInt(), (index) {
            return Center(
              child: Text(
                bottomTitleBuilder != null
                    ? bottomTitleBuilder(index.toDouble())
                    : index.toString(),
                style: textStyle,
              ),
            );
          }),
        ),
      );
    }
    return null;
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
