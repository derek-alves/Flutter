import 'package:fl_chart/fl_chart.dart';
import 'package:test/rolling_performance.dart';

Map<String, dynamic> getDataForFilter(
  String filter,
) {
  final jsonData = rollingPerformanceMock;
  List<FlSpot> generateSpots(List<double> values) {
    return List.generate(
      values.length,
      (index) => FlSpot(index.toDouble(), values[index]),
    );
  }

  final Map<String, double> fundData = jsonData["LU0072462426"] ?? {};
  final List<double> primaryValues = fundData.values
      .map((value) => value * 10)
      .toList(); // Convert to thousands

  int dataLimit;
  switch (filter) {
    case '6M':
      dataLimit = 180;
      break;
    case '1A':
      dataLimit = 365;
      break;
    case '3A':
      dataLimit = 365 * 3;
      break;
    case '5A':
      dataLimit = 365 * 5;
      break;
    default:
      dataLimit = primaryValues.length;
      break;
  }

  // Limit data to the specified range
  final List<double> limitedPrimaryValues =
      primaryValues.take(dataLimit).toList();

  // Generate dummy secondary data
  final List<double> secondaryValues = List.generate(
    limitedPrimaryValues.length,
    (index) => limitedPrimaryValues[index] + (index % 10).toDouble(),
  );

  return {
    'primaryData': generateSpots(limitedPrimaryValues),
    'secondaryData': generateSpots(secondaryValues),
  };
}
