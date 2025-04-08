import 'package:flutter/material.dart';
import 'package:test/mater/chart_meter.dart';

class ChartMeterPage extends StatelessWidget {
  const ChartMeterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de configurações do gráfico: apenas os valores.
    final List<MeterDataConfig> meterData = [
      MeterDataConfig(value: 10),
      MeterDataConfig(value: 50),
      MeterDataConfig(value: 10),
      MeterDataConfig(value: 30),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo MeterChart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MeterChart(
          meterData: meterData,
          baseColor: Colors.green,
          height: 20,
        ),
      ),
    );
  }
}
