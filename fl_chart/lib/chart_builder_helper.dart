import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test/chart_builder.dart';

mixin ChartBuilderHelper on Widget {
  ({
    double yMin,
    double yMax,
    double xMax,
    double xMin,
    List<double> yAxisValues,
    int maxItems,
  }) getDynamicAxisFromPerformances({
    required List<LineBuilder> lines,
    double? target,
    int maxItems = 10,
  }) {
    final result = getAxiesFromPerformance(lines);

    List<double> yValues = [];
    double maxY = result.maxY;
    double minY = result.minY;
    if (target != null) {
      final axis = _getAxisWithTarget(
        target: target,
        maxItems: maxItems,
        maxY: maxY,
        minY: minY,
      );
      yValues = axis.axisValues;
      minY = axis.minY;
      maxY = axis.maxY;
    } else {
      yValues = _getAxisWithoutTarget(
        maxItems: maxItems,
        result: result,
      );
    }
    return (
      yMax: maxY,
      yMin: minY,
      yAxisValues: yValues,
      xMin: result.minX,
      xMax: result.maxX,
      maxItems: result.maxItems,
    );
  }

  List<double> _getAxisWithoutTarget({
    required int maxItems,
    required AxisData result,
  }) {
    final double step = (result.maxY - result.minY) / (maxItems - 1);
    final double firstValue = result.minY;

    final List<double> resultado = List.generate(
      maxItems,
      (i) => firstValue + i * step,
    );

    return resultado;
  }

  double getStep({
    required double target,
    required double minY,
    required double maxY,
    required int targetIndex,
    required int maxItems,
  }) {
    if (maxItems <= 1 || minY == maxY) return target * 0.01;

    if (targetIndex == 0 || (maxItems - 1 - targetIndex) == 0) {
      return target * 0.01;
    }

    final double minDiff = (target - minY) / targetIndex;
    final double maxDiff = (maxY - target) / (maxItems - 1 - targetIndex);
    double step = max(minDiff, maxDiff);

    final double epsilon = target * 0.001;
    step += epsilon;

    if (step < 0) {
      return target * 0.01;
    }

    return step;
  }

  ({
    double minY,
    double maxY,
    List<double> axisValues,
  }) _getAxisWithTarget({
    required double target,
    required int maxItems,
    required double maxY,
    required double minY,
  }) {
    final int targetIndex = getTargetIndex(
      maxItems: maxItems,
      maxY: maxY,
      minY: minY,
      target: target,
    );

    final double step = getStep(
      target: target,
      minY: minY,
      targetIndex: targetIndex,
      maxY: maxY,
      maxItems: maxItems,
    );

    final double firstValue = target - targetIndex * step;
    final double lastValue = firstValue + (maxItems - 1) * step;

    final List<double> resultado = List.generate(
      maxItems,
      (i) => firstValue + i * step,
    );

    return (
      axisValues: resultado,
      maxY: lastValue,
      minY: firstValue,
    );
  }

  int getTargetIndex({
    required int maxItems,
    required double maxY,
    required double minY,
    required double target,
  }) {
    if (maxItems <= 1) return 0;

    if (minY == maxY) {
      return 0;
    }

    final double gapMin = target - minY;
    final double gapMax = maxY - target;

    if (gapMin <= 0) return 0;
    if (gapMax <= 0) return maxItems - 1;

    final int targetIndex =
        ((maxItems - 1) * gapMin / (gapMin + gapMax)).round();

    return max(0, min(targetIndex, maxItems - 1));
  }

  AxisData getAxiesFromPerformance(
    List<LineBuilder> lines,
  ) {
    final data = lines.expand((line) => line.config.data).toList();

    final longestList = lines
        .map((line) => line.config.data)
        .reduce((a, b) => a.length > b.length ? a : b);

    double dynamicMaxY = data.reduce((a, b) => a > b ? a : b);
    double dynamicMinY = data.reduce((a, b) => a < b ? a : b);
    double dynamicMaxX = (longestList.length - 1);

    double minX = 0;

    double yExtraSize = (dynamicMaxY - dynamicMinY) * 0.1;
    if (dynamicMaxY == dynamicMinY) {
      yExtraSize = dynamicMaxY / 2;
      dynamicMinY -= yExtraSize;
      dynamicMaxY += yExtraSize;
      dynamicMaxX = 2;
      minX = 1;
    }

    return (
      minX: minX,
      maxX: dynamicMaxX,
      maxY: dynamicMaxY + yExtraSize,
      minY: dynamicMinY - yExtraSize,
      maxItems: longestList.length,
    );
  }

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
}

typedef AxisData = ({
  double maxX,
  double maxY,
  double minY,
  double minX,
  int maxItems,
});
