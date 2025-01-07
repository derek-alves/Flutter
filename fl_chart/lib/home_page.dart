import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFilter = '1M';
  late List<String> crossAxisLabels;
  late List<FlSpot> primaryData;
  late List<FlSpot> secondaryData;

  @override
  void initState() {
    super.initState();
    updateDataForFilter(selectedFilter);
  }

  void updateDataForFilter(String filter) {
    final data = getDataForFilter(filter);
    setState(() {
      selectedFilter = filter;
      crossAxisLabels = data['crossAxisLabels'];
      primaryData = data['primaryData'];
      secondaryData = data['secondaryData'];
    });
  }

  Widget _buildFilterButton(String filter) {
    return GestureDetector(
      onTap: () => updateDataForFilter(filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selectedFilter == filter ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          filter,
          style: TextStyle(
            color: selectedFilter == filter ? Colors.white : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ComparisonChart(
              crossAxisLabels: crossAxisLabels,
              showComparison: true,
              primaryData: primaryData,
              secondaryData: secondaryData,
              primaryLabel: 'BGF China Bond A2',
              secondaryLabel: 'S&P 500',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton('1M'),
                _buildFilterButton('3M'),
                _buildFilterButton('6M'),
                _buildFilterButton('1A'),
                _buildFilterButton('3A'),
                _buildFilterButton('5A'),
                _buildFilterButton('Tudo'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ComparisonChart extends StatefulWidget {
  final List<FlSpot> primaryData;
  final List<FlSpot> secondaryData;
  final String primaryLabel;
  final String secondaryLabel;
  final List<String> crossAxisLabels;
  final bool showComparison;
  const ComparisonChart({
    super.key,
    required this.primaryData,
    required this.secondaryData,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.crossAxisLabels,
    this.showComparison = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ComparisonChartState createState() => _ComparisonChartState();
}

class _ComparisonChartState extends State<ComparisonChart> {
  String selectedFilter = '1M';
  FlSpot? selectedSpot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, bottom: 24.0), // Ajuste o espaço inferior

      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (widget.crossAxisLabels.length - 1).toDouble(),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            verticalInterval: 2,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 1,
                dashArray: null,
              );
            },
          ),
          titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                interval: widget.crossAxisLabels.length > 8
                    ? (widget.crossAxisLabels.length / 4).ceil().toDouble()
                    : 1,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    space: 2,
                    axisSide: AxisSide.bottom,
                    angle: 1,
                    child: Text(widget.crossAxisLabels[value.toInt()]),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: widget.primaryData,
              isCurved: true,
              color: Colors.green,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
            if (widget.showComparison)
              LineChartBarData(
                spots: widget.secondaryData,
                isCurved: true,
                color: Colors.brown,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => Colors.white,
              tooltipRoundedRadius: 8,
              tooltipMargin: 8,
              tooltipPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              getTooltipItems: (touchedSpots) {
                if (touchedSpots.isEmpty) return [];

                List<LineTooltipItem> tooltipItems = [];
                for (var spot in touchedSpots) {
                  final color = spot.bar.color ?? Colors.black;
                  final value = spot.y.toStringAsFixed(2);

                  tooltipItems.add(
                    LineTooltipItem(
                      value,
                      TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return tooltipItems;
              },
              fitInsideHorizontally: true,
              fitInsideVertically: false,
            ),
            touchCallback: (_, touchResponse) {
              if (touchResponse?.lineBarSpots != null &&
                  touchResponse?.lineBarSpots?.isNotEmpty == true) {
                setState(() {
                  selectedSpot = touchResponse!.lineBarSpots!.first;
                });
              }
            },
            handleBuiltInTouches: true,
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  const FlLine(strokeWidth: 0), // Linha invisível
                  FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: barData.color ?? Colors.green,
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
