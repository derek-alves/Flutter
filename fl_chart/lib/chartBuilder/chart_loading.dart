import 'dart:math';
import 'package:flutter/material.dart';

class ChartLoadingWidget extends StatefulWidget {
  final bool animate;
  final Color lineColor;

  const ChartLoadingWidget({
    Key? key,
    this.animate = true,
    this.lineColor = Colors.blue,
  }) : super(key: key);

  @override
  _ChartLoadingWidgetState createState() => _ChartLoadingWidgetState();
}

class _ChartLoadingWidgetState extends State<ChartLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _curvedAnimation;

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    if (widget.animate) {
      _controller.repeat();
    }

    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
        animation: _curvedAnimation,
        builder: (context, child) {
          double progress = widget.animate ? _curvedAnimation.value : 1.0;
          final fractions = widget.animate
              ? _getProgression(progress)
              : (startFraction: 0.0, endFraction: 1.0);

          return CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: ChartLoadingPainter(
              data: _data,
              startFraction: fractions.startFraction,
              endFraction: fractions.endFraction,
              lineColor: widget.lineColor,
            ),
          );
        },
      );
    });
  }

  ({double startFraction, double endFraction}) _getProgression(
      double progress) {
    if (progress < 0.5) {
      return (startFraction: 0.0, endFraction: progress * 2);
    }
    return (startFraction: (progress - 0.5) * 2, endFraction: 1.0);
  }
}

class ChartLoadingPainter extends CustomPainter {
  final List<double> data;
  final double startFraction;
  final double endFraction;
  final Color lineColor;

  ChartLoadingPainter({
    required this.data,
    required this.startFraction,
    required this.endFraction,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = _createPaint();
    final points = _generatePoints(size);
    final fullPath = _buildPath(points);
    final animatedPath = _extractAnimatedPath(fullPath);

    canvas.drawPath(animatedPath, paint);
  }

  Paint _createPaint() {
    return Paint()
      ..color = lineColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  List<Offset> _generatePoints(Size size) {
    final int dataSize = data.length;
    final double dx = size.width / (dataSize - 1);
    final double minY = data.reduce(min);
    final double maxY = data.reduce(max);
    final double range = maxY - minY;

    return List.generate(dataSize, (i) {
      final x = i * dx;
      final normalizedValue = (data[i] - minY) / range;
      final y = size.height - (normalizedValue * size.height);
      return Offset(x, y);
    });
  }

  Path _buildPath(List<Offset> points) {
    final path = Path();
    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
    }
    return path;
  }

  Path _extractAnimatedPath(Path fullPath) {
    final metrics = fullPath.computeMetrics();
    final animatedPath = Path();

    for (final metric in metrics) {
      final double drawStart = metric.length * startFraction;
      final double drawEnd = metric.length * endFraction;
      final subPath = metric.extractPath(drawStart, drawEnd);
      animatedPath.addPath(subPath, Offset.zero);
    }

    return animatedPath;
  }

  @override
  bool shouldRepaint(covariant ChartLoadingPainter oldDelegate) {
    return oldDelegate.startFraction != startFraction ||
        oldDelegate.endFraction != endFraction ||
        oldDelegate.data != data ||
        oldDelegate.lineColor != lineColor;
  }
}
