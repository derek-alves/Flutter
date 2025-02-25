// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum AssetType { stocks, bonds, realEstate, commodities, cash }

class AssetLocation {
  final AssetType type;
  final double percent;

  const AssetLocation({required this.type, required this.percent});

  AssetLocation copyWith({
    AssetType? type,
    double? percent,
  }) {
    return AssetLocation(
      type: type ?? this.type,
      percent: percent ?? this.percent,
    );
  }
}

class PieChartWithNormalizedData extends StatelessWidget {
  final List<AssetLocation> assetLocations;

  const PieChartWithNormalizedData({super.key, required this.assetLocations});

  @override
  Widget build(BuildContext context) {
    final normalizedData = _normalizePercentages(assetLocations);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gráfico de Pizza com Normalização"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gráfico de Pizza
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: _buildPieChartSections(normalizedData),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            // Labels
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: normalizedData.map((asset) {
                return _buildLabel(
                  _getColorForType(asset.type),
                  _getLabelForType(asset.type),
                  "${asset.percent.toStringAsFixed(2)}%",
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<AssetLocation> _normalizePercentages(List<AssetLocation> assets) {
    double total = assets.fold(0, (sum, asset) => sum + asset.percent);

    if (total == 0) {
      return assets
          .map((asset) => AssetLocation(type: asset.type, percent: 0))
          .toList();
    }

    double factor = 100 / total;
    List<AssetLocation> normalized = assets
        .map((asset) =>
            AssetLocation(type: asset.type, percent: asset.percent * factor))
        .toList();

    double normalizedTotal =
        normalized.fold(0, (sum, asset) => sum + asset.percent);
    double difference = 100 - normalizedTotal;

    if (difference != 0) {
      AssetLocation largestAsset =
          normalized.reduce((a, b) => a.percent > b.percent ? a : b);
      largestAsset =
          largestAsset.copyWith(percent: largestAsset.percent + difference);
    }

    return normalized;
  }

  List<PieChartSectionData> _buildPieChartSections(
      List<AssetLocation> normalizedData) {
    return normalizedData
        .map(
          (asset) => PieChartSectionData(
            color: _getColorForType(asset.type),
            value: asset.percent,
            title: '',
            radius: 50,
          ),
        )
        .toList();
  }

  // Criação de cada label
  Widget _buildLabel(Color color, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 4, // Quadrado fino e maior
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Obter cor para cada tipo de ativo
  Color _getColorForType(AssetType type) {
    switch (type) {
      case AssetType.stocks:
        return Colors.red;
      case AssetType.bonds:
        return Colors.amber;
      case AssetType.realEstate:
        return Colors.blue;
      case AssetType.commodities:
        return Colors.green;
      case AssetType.cash:
        return Colors.purple;
    }
  }

  // Obter rótulo para cada tipo de ativo
  String _getLabelForType(AssetType type) {
    switch (type) {
      case AssetType.stocks:
        return "Stocks";
      case AssetType.bonds:
        return "Bonds";
      case AssetType.realEstate:
        return "Real Estate";
      case AssetType.commodities:
        return "Commodities";
      case AssetType.cash:
        return "Cash";
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: PieChartWithNormalizedData(
      assetLocations: [
        AssetLocation(type: AssetType.stocks, percent: 25),
        AssetLocation(type: AssetType.bonds, percent: 30),
        AssetLocation(type: AssetType.realEstate, percent: 20),
        AssetLocation(type: AssetType.commodities, percent: 15),
        AssetLocation(type: AssetType.cash, percent: 8), // Soma > 100%
      ],
    ),
  ));
}
