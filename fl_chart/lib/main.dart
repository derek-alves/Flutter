import 'package:flutter/material.dart';
import 'package:test/pie_chart.dart';

// Example usage
void main() {
  runApp(const MaterialApp(
    home: PieChartWithNormalizedData(
      assetLocations: [
        AssetLocation(type: AssetType.stocks, percent: 20),
        AssetLocation(type: AssetType.bonds, percent: 25),
        AssetLocation(type: AssetType.realEstate, percent: 30),
        AssetLocation(type: AssetType.commodities, percent: 15),
        // AssetLocation(type: AssetType.cash, percent: 10),
      ],
    ),
  ));
}
