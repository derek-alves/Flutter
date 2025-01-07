// Função para gerar rótulos e dados fictícios
import 'package:fl_chart/fl_chart.dart';

Map<String, dynamic> getDataForFilter(String filter) {
  switch (filter) {
    case '1M': // Semanas
      return {
        'crossAxisLabels': ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
        'primaryData': const [
          FlSpot(0, 1.2),
          FlSpot(1, 1.5),
          FlSpot(2, 1.8),
          FlSpot(3, 2.0),
        ],
        'secondaryData': const [
          FlSpot(0, 1.1),
          FlSpot(1, 1.3),
          FlSpot(2, 1.7),
          FlSpot(3, 1.9),
        ],
      };
    case '3M': // Semanas
      return {
        'crossAxisLabels': ['Week 1', 'Week 5', 'Week 9', 'Week 13'],
        'primaryData': const [
          FlSpot(0, 1.3),
          FlSpot(1, 1.6),
          FlSpot(2, 1.9),
          FlSpot(3, 2.2),
        ],
        'secondaryData': const [
          FlSpot(0, 1.0),
          FlSpot(1, 1.4),
          FlSpot(2, 1.8),
          FlSpot(3, 2.1),
        ],
      };
    case '6M': // Meses
      return {
        'crossAxisLabels': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        'primaryData': const [
          FlSpot(0, 1.5),
          FlSpot(1, 2.0),
          FlSpot(2, 1.8),
          FlSpot(3, 2.1),
          FlSpot(4, 2.3),
          FlSpot(5, 2.0),
        ],
        'secondaryData': const [
          FlSpot(0, 1.4),
          FlSpot(1, 1.9),
          FlSpot(2, 1.7),
          FlSpot(3, 2.0),
          FlSpot(4, 2.2),
          FlSpot(5, 1.8),
        ],
      };
    case '1A': // Meses
      return {
        'crossAxisLabels': [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec'
        ],
        'primaryData':
            List.generate(12, (i) => FlSpot(i.toDouble(), 1.5 + i * 0.1)),
        'secondaryData':
            List.generate(12, (i) => FlSpot(i.toDouble(), 1.3 + i * 0.1)),
      };
    case '3A': // Anos
      return {
        'crossAxisLabels': ['Year 1', 'Year 2', 'Year 3'],
        'primaryData': const [
          FlSpot(0, 1.0),
          FlSpot(1, 1.5),
          FlSpot(2, 2.0),
        ],
        'secondaryData': const [
          FlSpot(0, 0.9),
          FlSpot(1, 1.4),
          FlSpot(2, 1.9),
        ],
      };
    case '5A':
      return {
        'crossAxisLabels': ['Year 1', 'Year 2', 'Year 3', 'Year 4', 'Year 5'],
        'primaryData': const [
          FlSpot(0, 1.1),
          FlSpot(1, 1.6),
          FlSpot(2, 1.9),
          FlSpot(3, 2.3),
          FlSpot(4, 2.5),
        ],
        'secondaryData': const [
          FlSpot(0, 1.0),
          FlSpot(1, 1.5),
          FlSpot(2, 1.8),
          FlSpot(3, 2.2),
          FlSpot(4, 2.4),
        ],
      };
    case 'Tudo': // Anos
      return {
        'crossAxisLabels': [
          'Year 1',
          'Year 2',
          'Year 3',
          'Year 4',
          'Year 5',
          'Year 6',
          'Year 7',
          'Year 8',
          'Year 9',
          'Year 10',
          'Year 11',
          'Year 12',
          'Year 13'
              'Year 14'
              'Year 15'
              'Year 16'
              'Year 17'
        ],
        'primaryData':
            List.generate(16, (i) => FlSpot(i.toDouble(), 1.5 + i * 0.1)),
        'secondaryData':
            List.generate(16, (i) => FlSpot(i.toDouble(), 1.3 + i * 0.1)),
      };
    default:
      return {
        'crossAxisLabels': [],
        'primaryData': [],
        'secondaryData': [],
      };
  }
}
