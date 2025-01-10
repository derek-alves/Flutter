import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

mixin ChartUtils {
  List<HorizontalLine> generateHorizontalLines({
    required List<double> data,
    required int numberOfLines,
  }) {
    if (data.isEmpty) return [];

    double minValue = data.reduce((a, b) => a < b ? a : b);
    double maxValue = data.reduce((a, b) => a > b ? a : b);

    double padding = (maxValue - minValue) * 0.1;
    minValue -= padding;
    maxValue += padding;

    double step = (maxValue - minValue) / (numberOfLines - 1);

    return List.generate(numberOfLines, (index) {
      double yValue = minValue + step * index;
      return HorizontalLine(
        y: yValue,
        color: Colors.grey.withOpacity(0.5),
        strokeWidth: 1,
        dashArray: null,
        label: HorizontalLineLabel(
          show: true,
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(right: 0),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          labelResolver: (line) => '\$${line.y.toInt()}',
        ),
      );
    });
  }

  LineTooltipItem getLineTooltipItem(
    String clickedDate,
    String primaryValue,
    String? secondaryValue,
    bool showComparison,
  ) {
    return LineTooltipItem(
      '$clickedDate\n',
      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
      children: [
        TextSpan(
          text: '■ ',
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: '\$$primaryValue: ',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
            ),
            const TextSpan(
              text: '+10%\n',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        if (showComparison && secondaryValue != null)
          TextSpan(
            text: '■ ',
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '\$$secondaryValue: ',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
              ),
              const TextSpan(
                text: '-64%',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
              ),
            ],
          ),
      ],
    );
  }

  List<FlSpot> generateSpots(List<double> values) {
    return List.generate(
      values.length,
      (index) => FlSpot(index.toDouble(), values[index]),
    );
  }

  String getTitle(List<String> labels, double value, String filter) {
    if (labels.isEmpty || value < 0 || value.toInt() >= labels.length) {
      return '';
    }

    final String date = labels[value.toInt()];
    final DateTime parsedDate = DateTime.parse(date);

    switch (filter) {
      case '6M':
        return '${parsedDate.day.toString().padLeft(2, '0')}/${parsedDate.month.toString().padLeft(2, '0')}';
      case '1A':
      case '3A':
      case '5A':
        return '${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year.toString().substring(2)}';
      default:
        return '${parsedDate.year}';
    }
  }
}
