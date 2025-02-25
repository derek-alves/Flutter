import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleLineGraph extends StatelessWidget {
  const SimpleLineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        width: double.maxFinite,
        height: 300,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
              show: false,
            ),
            gridData: const FlGridData(
              drawHorizontalLine: false,
              drawVerticalLine: false,
            ),
            titlesData: const FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: [
              LineChartBarData(
                dotData: const FlDotData(
                  show: false,
                ),
                isCurved: false,
                color: Colors.green,
                spots: const [
                  FlSpot(0, 1),
                  FlSpot(1, 3),
                  FlSpot(2, 2),
                  FlSpot(3, 5),
                  FlSpot(4, 4),
                  FlSpot(5, 6),
                ],
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [Colors.green.withOpacity(0.3), Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
