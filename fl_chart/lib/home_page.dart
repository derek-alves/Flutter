import 'package:flutter/material.dart';
import 'package:test/comparison_chart.dart';
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
  List<String> crossAxisLabels = [];
  late List<double> primaryData;
  late List<double> secondaryData;

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
      crossAxisLabels = data['selectedLabels'];
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
                selectedFilter: selectedFilter,
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
