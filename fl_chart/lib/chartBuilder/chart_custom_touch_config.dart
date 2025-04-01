import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineTouchData {
  final void Function(double x, double y)? onTouchCallback;
  final bool showTooltip;

  const CustomLineTouchData({
    this.onTouchCallback,
    this.showTooltip = false, // valor padrão: não mostra
  });

  /// Retorna a configuração de LineTouchData conforme solicitado:
  /// - Exibe uma linha cinza vertical (através do getTouchedSpotIndicator)
  /// - Não exibe o tooltip (toolchip)
  /// - Executa o callback com os valores de x e y clicados
  LineTouchData get data => LineTouchData(
        // Ativa o touch
        enabled: true,
        // Desabilita os toques built-in se necessário (caso queira customizar totalmente)
        handleBuiltInTouches: true,
        // Configura o indicador do toque (linha vertical cinza)
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return const TouchedSpotIndicatorData(
              // Linha vertical cinza com espessura de 1
              FlLine(color: Colors.grey, strokeWidth: 10),
              // Não exibe pontos ou bolinhas
              FlDotData(show: true),
            );
          }).toList();
        },
        getTouchLineStart: (_, __) => 0,
        // Força o fim da linha no final do gráfico (altura máxima do gráfico)
        getTouchLineEnd: (_, __) => double.infinity,
        // Configura o tooltip para não exibir nada

        touchTooltipData: showTooltip
            ? LineTouchTooltipData(
                tooltipRoundedRadius: 6,
                getTooltipColor: (touchedSpot) => Colors.green,
                tooltipPadding: const EdgeInsets.all(8),
                getTooltipItems: (List<LineBarSpot> touchedSpots) {
                  return touchedSpots.map((spot) {
                    return LineTooltipItem(
                      'x: ${spot.x}, y: ${spot.y}',
                      const TextStyle(color: Colors.white),
                    );
                  }).toList();
                },
              )
            : LineTouchTooltipData(
                tooltipPadding: EdgeInsets.zero,
                tooltipRoundedRadius: 0,
                getTooltipColor: (touchedSpot) => Colors.transparent,
                getTooltipItems: (touchedSpots) => touchedSpots
                    .map((_) => const LineTooltipItem(
                          '', // texto vazio
                          TextStyle(color: Colors.transparent), // invisível
                        ))
                    .toList(),
              ),
        // Callback de toque: quando o usuário solta o toque (tap up)
        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
          // Aqui verificamos se o evento é do tipo tap e se temos spots tocados
          if (event is FlTapUpEvent &&
              touchResponse != null &&
              touchResponse.lineBarSpots != null &&
              touchResponse.lineBarSpots!.isNotEmpty) {
            final spot = touchResponse.lineBarSpots!.first;
            // Chama o callback passando os valores de x e y do ponto tocado
            if (onTouchCallback != null) {
              onTouchCallback!(spot.x, spot.y);
            }
          }
        },
      );
}
