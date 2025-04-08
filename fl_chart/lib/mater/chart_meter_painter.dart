import 'package:flutter/material.dart';
import 'package:test/mater/chart_meter.dart';

class MeterChartPainter extends CustomPainter {
  final List<MeterDataConfig> meterData;
  final MaterialColor baseColor;
  final double progress;
  final double borderRadius; // 👈 Novo parâmetro
  final bool isLoading;
  final bool disabled;
  MeterChartPainter({
    required this.meterData,
    required this.baseColor,
    required this.progress,
    this.borderRadius = 0.0, // 👈 valor padrão (sem bordas)
    this.isLoading = false,
    this.disabled = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double total =
        meterData.fold(0.0, (prev, element) => prev + element.value);
    if (total <= 0) return;

    double startX = 0.0;
    final paint = Paint()..style = PaintingStyle.fill;
    final radius = Radius.circular(borderRadius);

    for (int i = 0; i < meterData.length; i++) {
      final item = meterData[i];
      final double ratio = item.value / total;
      final double segmentWidth = ratio * size.width * progress;

      paint.color = _getSegmentColor(index: i);

      final double left = startX;
      const double top = 0;
      final double right = startX + segmentWidth;
      final double bottom = size.height;

      final rRect = _buildRRect(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        index: i,
        totalItems: meterData.length,
        radius: radius,
      );

      canvas.drawRRect(rRect, paint);
      startX += segmentWidth;
    }
  }

  RRect _buildRRect({
    required double left,
    required double top,
    required double right,
    required double bottom,
    required int index,
    required int totalItems,
    required Radius radius,
  }) {
    final rect = Rect.fromLTRB(left, top, right, bottom);

    if (totalItems == 1) {
      // Apenas um segmento → bordas arredondadas em todos os lados
      return RRect.fromRectAndCorners(
        rect,
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      );
    }

    if (index == 0) {
      // Primeiro segmento → apenas à esquerda
      return RRect.fromRectAndCorners(
        rect,
        topLeft: radius,
        bottomLeft: radius,
      );
    }

    if (index == totalItems - 1) {
      // Último segmento → apenas à direita
      return RRect.fromRectAndCorners(
        rect,
        topRight: radius,
        bottomRight: radius,
      );
    }

    // Segmento do meio → sem bordas arredondadas
    return RRect.fromRectAndCorners(rect);
  }

  Color _getSegmentColor({required int index}) {
    if (isLoading) return Colors.grey[300]!;
    if (disabled) return Colors.grey[500]!;

    // Colorido normal baseado em baseColor
    final shades = [
      baseColor.shade600,
      baseColor.shade500,
      baseColor.shade400,
      baseColor.shade300,
      baseColor.shade200,
      baseColor.shade100,
      baseColor.shade50,
    ];
    return shades[index % shades.length];
  }

  @override
  bool shouldRepaint(covariant MeterChartPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.meterData != meterData ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.isLoading != isLoading ||
        oldDelegate.disabled != disabled;
  }
}
