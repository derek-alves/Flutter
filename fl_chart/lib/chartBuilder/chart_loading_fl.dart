import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartLoadingFLWidget extends StatefulWidget {
  const ChartLoadingFLWidget({Key? key}) : super(key: key);

  @override
  State<ChartLoadingFLWidget> createState() => _ChartLoadingFLWidgetState();
}

class _ChartLoadingFLWidgetState extends State<ChartLoadingFLWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final List<double> _data = [
    3,
    5,
    2,
    5,
    6,
    11,
    13,
    10,
    13,
    12,
    15,
    13,
    18,
    19,
    22,
    20,
    24
  ];

  late final List<FlSpot> _spots;

  @override
  void initState() {
    super.initState();
    // Cria os pontos do gráfico usando o índice como coordenada x
    _spots = List.generate(
      _data.length,
      (index) => FlSpot(index.toDouble(), _data[index]),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Função para gerar a lista de pontos durante a fase de crescimento da linha.
  // t varia de 0 a 1: quando t=0, nenhum ponto (ou apenas o inicial) é exibido; t=1 exibe toda a linha.
  List<FlSpot> _buildDrawingSpots(double t) {
    final total = _spots.length;
    double targetIndex = t * (total - 1);
    int baseIndex = targetIndex.floor();
    double remainder = targetIndex - baseIndex;

    List<FlSpot> displayed = [];
    // Adiciona todos os pontos completos até o ponto base
    for (int i = 0; i <= baseIndex && i < total; i++) {
      displayed.add(_spots[i]);
    }
    // Se não atingiu o último ponto, adiciona um ponto interpolado
    if (baseIndex < total - 1) {
      double x = _spots[baseIndex].x +
          remainder * (_spots[baseIndex + 1].x - _spots[baseIndex].x);
      double y = _spots[baseIndex].y +
          remainder * (_spots[baseIndex + 1].y - _spots[baseIndex].y);
      displayed.add(FlSpot(x, y));
    }
    return displayed;
  }

  // Função para gerar a lista de pontos durante a fase de remoção do início.
  // s varia de 0 a 1: quando s=0, a linha completa é exibida; quando s=1, só o último ponto é mostrado.
  List<FlSpot> _buildErasingSpots(double s) {
    final total = _spots.length;
    double removalIndex = s * (total - 1);
    int baseIndex = removalIndex.floor();
    double remainder = removalIndex - baseIndex;

    List<FlSpot> displayed = [];
    // Para s=0, exibe toda a linha
    if (baseIndex >= total - 1) {
      displayed.add(_spots.last);
      return displayed;
    }

    // Adiciona primeiro um ponto interpolado para representar a transição suave
    double x = _spots[baseIndex].x +
        remainder * (_spots[baseIndex + 1].x - _spots[baseIndex].x);
    double y = _spots[baseIndex].y +
        remainder * (_spots[baseIndex + 1].y - _spots[baseIndex].y);
    displayed.add(FlSpot(x, y));

    // Adiciona o restante dos pontos a partir do ponto interpolado
    for (int i = baseIndex + 1; i < total; i++) {
      displayed.add(_spots[i]);
    }
    return displayed;
  }

  // Função que escolhe qual animação aplicar com base no valor atual do _animation
  List<FlSpot> getAnimatedSpots() {
    final v = _animation.value;
    // Fase 1: desenhando a linha
    if (v <= 0.5) {
      final t = v / 0.5; // normaliza para [0,1]
      return _buildDrawingSpots(t);
    }
    // Fase 2: apagando a parte inicial da linha
    else {
      final s = (v - 0.5) / 0.5; // normaliza para [0,1]
      return _buildErasingSpots(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (_data.length - 1).toDouble(),
        minY: 0,
        // Define o valor máximo do eixo Y com uma margem extra
        maxY: _data.reduce((a, b) => a > b ? a : b) + 5,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.green,
            barWidth: 4,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
            spots: getAnimatedSpots(),
          ),
        ],
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
