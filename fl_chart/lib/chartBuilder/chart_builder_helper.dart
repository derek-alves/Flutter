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
    if (target != null) {
      return _getAxisWithTarget(
        target: target,
        maxItems: maxItems,
        lines: lines,
      );
    }
    return _getAxisWithoutTarget(
      maxItems: maxItems,
      lines: lines,
    );
  }

  ChartConfiguration _getAxisWithoutTarget({
    required int maxItems,
    required List<LineConfig> lines,
  }) {
    final performanceData = _getAxiesFromPerformance(lines);
    double step =
        (performanceData.maxY - performanceData.minY) / (maxItems - 1);
    double firstValue = performanceData.minY;

    final yValues = List.generate(maxItems, (i) => firstValue + i * step);
    return ChartConfiguration(
      widget: WidgetConfiguration(),
      axis: AxisConfiguration(
        minX: performanceData.minX,
        maxX: performanceData.maxX,
        minY: performanceData.minY,
        maxY: performanceData.maxY,
      ),
      yValues: yValues,
      maxItems: performanceData.maxItems,
    );
  }

  double _defaultStep(double target) => target * 0.01;

  double _calculateStep({
    required double target,
    required double minY,
    required double maxY,
    required int targetIndex,
    required int maxItems,
  }) {
    final double minDiff = (target - minY) / targetIndex;
    final double maxDiff = (maxY - target) / (maxItems - 1 - targetIndex);
    return max(minDiff, maxDiff);
  }

  double _getStep({
    required double target,
    required double minY,
    required double maxY,
    required int targetIndex,
    required int maxItems,
  }) {
    final bool hasInsufficientItems = maxItems <= 1;
    final bool hasNoVariation = minY == maxY;
    final bool isFirstDataPoint = targetIndex == 0;
    final bool isLastDataPoint = (maxItems - 1 - targetIndex) == 0;

    if (hasInsufficientItems ||
        hasNoVariation ||
        isFirstDataPoint ||
        isLastDataPoint) {
      return _defaultStep(target);
    }

    double step = _calculateStep(
      target: target,
      minY: minY,
      maxY: maxY,
      targetIndex: targetIndex,
      maxItems: maxItems,
    );

    step += target * 0.001;

    return step < 0 ? _defaultStep(target) : step;
  }

  ChartConfiguration _getAxisWithTarget({
    required double target,
    required int maxItems,
    required List<LineConfig> lines,
  }) {
    final performanceData = _getAxiesFromPerformance(lines);
    int targetIndex = _getTargetIndex(
      maxItems: maxItems,
      maxY: performanceData.maxY,
      minY: performanceData.minY,
      target: target,
    );

    double step = _getStep(
      target: target,
      minY: performanceData.minY,
      maxY: performanceData.maxY,
      targetIndex: targetIndex,
      maxItems: maxItems,
    );

    double firstValue = target - targetIndex * step;
    double lastValue = firstValue + (maxItems - 1) * step;

    List<double> axisValues =
        List.generate(maxItems, (i) => firstValue + i * step);

    return ChartConfiguration(
      widget: WidgetConfiguration(),
      axis: AxisConfiguration(
        minX: performanceData.minX,
        maxX: performanceData.maxX,
        minY: firstValue,
        maxY: lastValue,
      ),
      yValues: axisValues,
      maxItems: performanceData.maxItems,
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
    final _DataInfo dataInfo = _extractDataInfo(lines);
    return _calculateAxisData(dataInfo);
  }

  _DataInfo _extractDataInfo(List<LineConfig> lines) {
    final List<double> allData = lines.expand((line) => line.data).toList();
    final List<double> longestList = lines
        .map((line) => line.data)
        .reduce((a, b) => a.length > b.length ? a : b);
    final double maxValue = allData.reduce((a, b) => a > b ? a : b);
    final double minValue = allData.reduce((a, b) => a < b ? a : b);

    return _DataInfo(
      allData: allData,
      longestList: longestList,
      maxValue: maxValue,
      minValue: minValue,
    );
  }

  AxisData _calculateAxisData(_DataInfo dataInfo) {
    double dynamicMaxX = (dataInfo.longestList.length - 1).toDouble();

    double minX = 0;
    double yExtraSize = (dataInfo.maxValue - dataInfo.minValue) * 0.1;

    if (dataInfo.maxValue == dataInfo.minValue) {
      yExtraSize = dataInfo.maxValue / 2;
      return AxisData(
        minX: 1,
        maxX: 2,
        maxY: dataInfo.maxValue + yExtraSize,
        minY: dataInfo.minValue - yExtraSize,
        maxItems: dataInfo.longestList.length,
      );
    }

    return AxisData(
      minX: minX,
      maxX: dynamicMaxX,
      maxY: dataInfo.maxValue + yExtraSize,
      minY: dataInfo.minValue - yExtraSize,
      maxItems: dataInfo.longestList.length,
    );
  }
}

class _DataInfo {
  final List<double> allData;
  final List<double> longestList;
  final double maxValue;
  final double minValue;

  _DataInfo({
    required this.allData,
    required this.longestList,
    required this.maxValue,
    required this.minValue,
  });
}
