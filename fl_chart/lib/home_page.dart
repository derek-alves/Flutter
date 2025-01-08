import 'package:collection/collection.dart';
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
  String selectedFilter = '6M';
  late List<String> crossAxisLabels;
  late List<FlSpot> primaryData;
  late List<FlSpot> secondaryData;
  bool showComparison = false;

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
          color: selectedFilter == filter
              ? const Color(0xffDFECE4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          filter,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Comparar com',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'S&P 500',
                        style: TextStyle(fontSize: 16),
                      ),
                      Checkbox(
                        value: showComparison,
                        onChanged: (bool? value) {
                          setState(() {
                            showComparison = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ComparisonChart(
                crossAxisLabels: crossAxisLabels,
                showComparison: showComparison,
                primaryData: primaryData,
                secondaryData: secondaryData,
                primaryLabel: 'BGF China Bond A2',
                secondaryLabel: 'S&P 500',
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xffF4F6F7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFilterButton('6M'),
                    _buildFilterButton('1A'),
                    _buildFilterButton('3A'),
                    _buildFilterButton('5A'),
                    _buildFilterButton('Tudo'),
                  ],
                ),
              ),
            ],
          ),
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
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          clipData: const FlClipData.all(),
          minX: 0,
          maxX: (widget.crossAxisLabels.length - 1).toDouble(),
          minY: 800,
          maxY: 1600,
          extraLinesData: ExtraLinesData(
            extraLinesOnTop:
                true, // As linhas extras serão desenhadas acima do gráfico padrão

            horizontalLines: [
              for (double y in [
                600,
                700,
                800,
                900,
                1000,
                1100,
                1200,
                1300,
                1400,
                1500,
              ])
                HorizontalLine(
                  y: y, // Posição da linha no eixo Y
                  color: Colors.grey.withOpacity(0.5),
                  strokeWidth: 1,
                  dashArray: null, // Deixe como null para linhas sólidas
                  label: HorizontalLineLabel(
                    show: true,
                    alignment: Alignment
                        .topRight, // Posição das labels no topo da linha
                    padding: const EdgeInsets.only(
                        right: 0), // Espaçamento à direita
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    labelResolver: (line) =>
                        '\$${line.y.toInt()}', // Formato das labels
                  ),
                ),
            ],
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 40,
              axisNameWidget: Container(
                margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
                width: double.infinity, // Ocupa toda a largura disponível
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < widget.crossAxisLabels.length; i++)
                      if (i %
                              (widget.crossAxisLabels.length > 8
                                  ? (widget.crossAxisLabels.length / 10).ceil()
                                  : 1) ==
                          0)
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.crossAxisLabels[i],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        )
                  ],
                ),
              ),
              sideTitles: const SideTitles(
                showTitles: false, // Desativar os sideTitles
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(
              horizontal: BorderSide.none,
              vertical: BorderSide.none,
            ),
          ),
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
              maxContentWidth: 180,
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              tooltipRoundedRadius: 8,
              tooltipPadding: const EdgeInsets.all(16),
              getTooltipItems: (touchedSpots) {
                if (touchedSpots.isEmpty) return [];

                final touchedIndex = touchedSpots.first.x.toInt();
                final clickedDate = touchedIndex < widget.crossAxisLabels.length
                    ? widget.crossAxisLabels[touchedIndex]
                    : 'Unknown';

                final primarySpot = touchedSpots.firstWhereOrNull(
                  (spot) => spot.barIndex == 0,
                );
                final secondarySpot = touchedSpots.firstWhere(
                  (spot) => spot.barIndex == 1,
                );
                final primaryValue = primarySpot != null
                    ? primarySpot.y.toStringAsFixed(2)
                    : 'N/A';
                final secondaryValue = secondarySpot.y.toStringAsFixed(2);

                return touchedSpots.asMap().entries.map((e) {
                  if (e.key != 0) {
                    return null;
                  }
                  return LineTooltipItem(
                      '$clickedDate\n',
                      const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                      children: [
                        TextSpan(
                          text: '\$$primaryValue          ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: const [
                            TextSpan(
                              text: '+10%\n',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        TextSpan(
                          text: '\$$secondaryValue          ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: const [
                            TextSpan(
                              text: '-64%',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ]);
                }).toList();
              },
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
