import 'package:fl_chart/fl_chart.dart';

Map<String, dynamic> getDataForFilter(String filter) {
  switch (filter) {
    case '6M': // Meses
      return {
        'crossAxisLabels': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        'primaryData': const [
          FlSpot(0, 800),
          FlSpot(1, 1200),
          FlSpot(2, 1000),
          FlSpot(3, 1400),
          FlSpot(4, 1100),
          FlSpot(5, 1300),
        ],
        'secondaryData': const [
          FlSpot(0, 900),
          FlSpot(1, 1100),
          FlSpot(2, 1200),
          FlSpot(3, 1300),
          FlSpot(4, 1150),
          FlSpot(5, 1250),
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
        'primaryData': const [
          FlSpot(0, 800),
          FlSpot(1, 1000),
          FlSpot(2, 1200),
          FlSpot(3, 1100),
          FlSpot(4, 1300),
          FlSpot(5, 1250),
          FlSpot(6, 1400),
          FlSpot(7, 1350),
          FlSpot(8, 1500),
          FlSpot(9, 1450),
          FlSpot(10, 1400),
          FlSpot(11, 1350),
        ],
        'secondaryData': const [
          FlSpot(0, 850),
          FlSpot(1, 950),
          FlSpot(2, 1100),
          FlSpot(3, 1200),
          FlSpot(4, 1250),
          FlSpot(5, 1350),
          FlSpot(6, 1300),
          FlSpot(7, 1400),
          FlSpot(8, 1450),
          FlSpot(9, 1500),
          FlSpot(10, 1350),
          FlSpot(11, 1400),
        ],
      };
    case '3A': // Anos
      return {
        'crossAxisLabels': ['Jul', '2022', 'Jul', '2023', '2024'],
        'primaryData': const [
          FlSpot(0, 900),
          FlSpot(1, 1100),
          FlSpot(2, 1300),
          FlSpot(3, 1200),
          FlSpot(4, 1400),
          FlSpot(5, 1250),
        ],
        'secondaryData': const [
          FlSpot(0, 950),
          FlSpot(1, 1150),
          FlSpot(2, 1200),
          FlSpot(3, 1350),
          FlSpot(4, 1300),
          FlSpot(5, 1400),
        ],
      };
    case '5A':
      return {
        'crossAxisLabels': [
          '2021',
          '2022',
          '2023',
          '2024',
          '2025',
        ],
        'primaryData': const [
          FlSpot(0, 800),
          FlSpot(1, 1200),
          FlSpot(2, 1100),
          FlSpot(3, 1300),
          FlSpot(4, 1250),
        ],
        'secondaryData': const [
          FlSpot(0, 850),
          FlSpot(1, 1000),
          FlSpot(2, 1150),
          FlSpot(3, 1400),
          FlSpot(4, 1350),
        ],
      };
    case 'Tudo': // Anos
      return {
        'crossAxisLabels': [
          '2021',
          '2022',
          '2023',
          '2024',
          '2025',
          '2026',
          '2027',
          '2028',
          '2029',
          '2030',
          '2031',
          '2032',
          '2033',
          '2034',
          '2035',
          '2036',
        ],
        'primaryData': const [
          FlSpot(0, 800),
          FlSpot(1, 1200),
          FlSpot(2, 1100),
          FlSpot(3, 1400),
          FlSpot(4, 1250),
          FlSpot(5, 1350),
          FlSpot(6, 1450),
          FlSpot(7, 1500),
          FlSpot(8, 1400),
          FlSpot(9, 1300),
          FlSpot(10, 1200),
          FlSpot(11, 1100),
          FlSpot(12, 1000),
          FlSpot(13, 900),
          FlSpot(14, 850),
          FlSpot(15, 800),
        ],
        'secondaryData': const [
          FlSpot(0, 850),
          FlSpot(1, 1150),
          FlSpot(2, 1250),
          FlSpot(3, 1350),
          FlSpot(4, 1450),
          FlSpot(5, 1500),
          FlSpot(6, 1400),
          FlSpot(7, 1300),
          FlSpot(8, 1200),
          FlSpot(9, 1100),
          FlSpot(10, 1000),
          FlSpot(11, 950),
          FlSpot(12, 900),
          FlSpot(13, 850),
          FlSpot(14, 800),
          FlSpot(15, 750),
        ],
      };
    default:
      return {
        'crossAxisLabels': [],
        'primaryData': [],
        'secondaryData': [],
      };
  }
}
