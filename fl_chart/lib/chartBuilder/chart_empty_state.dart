import 'package:flutter/material.dart';

class PortfolioChart extends StatelessWidget {
  final String displayText;
  final List<double> dataPoints;

  const PortfolioChart({
    super.key,
    required this.displayText,
    required this.dataPoints,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 200),
      painter: ChartPainter(dataPoints),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 140.0),
          child: Text(
            displayText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<double> dataPoints;

  ChartPainter(this.dataPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    if (dataPoints.isEmpty) return;

    final double stepX = size.width / (dataPoints.length - 1);
    final double minY = dataPoints.reduce((a, b) => a < b ? a : b);
    final double maxY = dataPoints.reduce((a, b) => a > b ? a : b);
    final double scaleY = maxY - minY;

    for (int i = 0; i < dataPoints.length; i++) {
      double x = stepX * i;
      double normalizedY = scaleY == 0 ? 0.5 : (dataPoints[i] - minY) / scaleY;
      double y = size.height * (1 - normalizedY) * 0.7;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
