import 'dart:math';

import 'package:test/chartBuilder/chart_config.dart';
import 'package:test/chartBuilder/line_config.dart';

class ChartInitializer {
  late final ChartConfiguration config;

  ChartInitializer({
    required List<LineConfig> lines,
    double? target,
    int maxItems = 10,
  }) {
    config = _computeAxisData(lines, target: target, maxItems: maxItems);
  }

  AxisConfiguration get axis => config.axis;
  WidgetConfiguration get widget => config.widget;
  int get size => config.maxItems;
  List<double> get yValues => config.yValues;

  ChartConfiguration _computeAxisData(
    List<LineConfig> lines, {
    double? target,
    int maxItems = 10,
  }) {
    final performanceData = _getAxiesFromPerformance(lines);
    List<double> yValues = [];
    double maxY = performanceData.maxY;
    double minY = performanceData.minY;

    if (target != null) {
      final axisWithTarget = _getAxisWithTarget(
        target: target,
        maxItems: maxItems,
        maxY: maxY,
        minY: minY,
      );
      yValues = axisWithTarget.yValues;
      minY = axisWithTarget.minY;
      maxY = axisWithTarget.maxY;
    } else {
      yValues = _getAxisWithoutTarget(
        maxItems: maxItems,
        performanceData: performanceData,
      );
    }

    return ChartConfiguration(
      widget: WidgetConfiguration(),
      axis: AxisConfiguration(
        minX: performanceData.minX,
        maxX: performanceData.maxX,
        minY: minY,
        maxY: maxY,
      ),
      yValues: yValues,
      maxItems: performanceData.maxItems,
    );
  }

  List<double> _getAxisWithoutTarget({
    required int maxItems,
    required AxisData performanceData,
  }) {
    double step =
        (performanceData.maxY - performanceData.minY) / (maxItems - 1);
    double firstValue = performanceData.minY;

    return List.generate(maxItems, (i) => firstValue + i * step);
  }

  double _getStep({
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
    List<double> yValues,
  }) _getAxisWithTarget({
    required double target,
    required int maxItems,
    required double maxY,
    required double minY,
  }) {
    int targetIndex = _getTargetIndex(
      maxItems: maxItems,
      maxY: maxY,
      minY: minY,
      target: target,
    );

    double step = _getStep(
      target: target,
      minY: minY,
      maxY: maxY,
      targetIndex: targetIndex,
      maxItems: maxItems,
    );

    double firstValue = target - targetIndex * step;
    double lastValue = firstValue + (maxItems - 1) * step;

    List<double> axisValues =
        List.generate(maxItems, (i) => firstValue + i * step);

    return (
      minY: firstValue,
      maxY: lastValue,
      yValues: axisValues,
    );
  }

  int _getTargetIndex({
    required int maxItems,
    required double maxY,
    required double minY,
    required double target,
  }) {
    if (maxItems <= 1) return 0;
    if (minY == maxY) return 0;

    final double gapMin = target - minY;
    final double gapMax = maxY - target;

    if (gapMin <= 0) return 0;
    if (gapMax <= 0) return maxItems - 1;

    int targetIndex = ((maxItems - 1) * gapMin / (gapMin + gapMax)).round();

    return max(0, min(targetIndex, maxItems - 1));
  }

  AxisData _getAxiesFromPerformance(List<LineConfig> lines) {
    // Junta todos os dados de todas as linhas
    final List<double> data = lines.expand((line) => line.data).toList();

    // Obtém a lista com maior quantidade de dados entre as linhas
    final List<double> longestList = lines
        .map((line) => line.data)
        .reduce((a, b) => a.length > b.length ? a : b);

    double dynamicMaxY = data.reduce((a, b) => a > b ? a : b);
    double dynamicMinY = data.reduce((a, b) => a < b ? a : b);
    double dynamicMaxX = (longestList.length - 1).toDouble();

    double minX = 0;
    double yExtraSize = (dynamicMaxY - dynamicMinY) * 0.1;

    if (dynamicMaxY == dynamicMinY) {
      yExtraSize = dynamicMaxY / 2;
      dynamicMinY -= yExtraSize;
      dynamicMaxY += yExtraSize;
      dynamicMaxX = 2;
      minX = 1;
    }

    return AxisData(
      minX: minX,
      maxX: dynamicMaxX,
      maxY: dynamicMaxY + yExtraSize,
      minY: dynamicMinY - yExtraSize,
      maxItems: longestList.length,
    );
  }
}
