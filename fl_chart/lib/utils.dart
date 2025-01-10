import 'package:test/rolling_performance.dart';

Map<String, dynamic> getDataForFilter(
  String filter,
) {
  final jsonData = rollingPerformanceMock;

  // Dados do fundo ordenados por data
  final Map<String, double> fundData = jsonData["LU0072462426"] ?? {};
  final List<MapEntry<String, double>> sortedData = fundData.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key)); // Ordenar por data

  // Datas disponíveis
  final DateTime firstDate = DateTime.parse(sortedData.first.key);
  int daysLimit; // Define o limite de dias com base no filtro
  int step; // Define o intervalo para granularidade
  switch (filter) {
    case '6M':
      daysLimit = 180;
      step = 7; // Semanal
      break;
    case '1A':
      daysLimit = 365;
      step = 7; // Semanal
      break;
    case '3A':
      daysLimit = 365 * 3;
      step = 30; // Mensal
      break;
    case '5A':
      daysLimit = 365 * 5;
      step = 30; // Mensal
      break;
    default: // "Tudo"
      daysLimit = sortedData.length;
      step = 30; // Mensal
      break;
  }

  final DateTime startDate = firstDate;
  final DateTime endDate = firstDate.add(Duration(days: daysLimit));

// Filter the data within the interval and apply the granularity
  final List<MapEntry<String, double>> filteredData = sortedData
      .where((entry) =>
          DateTime.parse(entry.key).isAfter(startDate) &&
          DateTime.parse(entry.key).isBefore(endDate))
      .toList();

// Apply the granularity and extract both keys and values
  final List<String> selectedKeys = [];
  final List<double> limitedPrimaryValues = filteredData
      .asMap()
      .entries
      .where((entry) {
        final isSelected = entry.key % step == 0; // Apply granularity
        if (isSelected) {
          selectedKeys.add(entry.value.key); // Collect the key
        }
        return isSelected;
      })
      .map((entry) => entry.value.value * 10) // Convert to thousands
      .toList();

// Generate secondary data (just for example)
  final List<double> secondaryValues = List.generate(
    limitedPrimaryValues.length,
    (index) => limitedPrimaryValues[index] + (index % 10).toDouble(),
  );

// Return both the data and the keys
  return {
    'primaryData': limitedPrimaryValues,
    'secondaryData': secondaryValues,
    'selectedLabels': selectedKeys, // Include selected keys
  };
}
