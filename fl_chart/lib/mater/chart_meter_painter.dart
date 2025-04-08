import 'package:flutter/material.dart';
import 'package:test/mater/chart_meter.dart';

/// CustomPainter que desenha o gráfico do tipo “meter” com tons da baseColor
/// indo do mais escuro (primeiro item) ao mais claro (último item).
class MeterChartPainter extends CustomPainter {
  final List<MeterDataConfig> meterData;
  final MaterialColor baseColor;

  MeterChartPainter({
    required this.meterData,
    required this.baseColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double total =
        meterData.fold(0.0, (prev, element) => prev + element.value);
    if (total <= 0) return;

    double startX = 0.0;
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < meterData.length; i++) {
      final item = meterData[i];
      final double ratio = item.value / total;
      final double segmentWidth = ratio * size.width;

      paint.color = _getShadeColor(
        baseColor,
        i,
      );

      final rect = Rect.fromLTWH(startX, 0, segmentWidth, size.height);
      canvas.drawRect(rect, paint);
      startX += segmentWidth;
    }
  }

  Color _getShadeColor(MaterialColor baseColor, int index) {
    final shades = [
      baseColor.shade600,
      baseColor.shade500,
      baseColor.shade400,
      baseColor.shade300,
      baseColor.shade200,
      baseColor.shade100,
      baseColor.shade50,
    ];

    // Evita erro se tiver mais itens que tons
    return shades[index % shades.length];
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
