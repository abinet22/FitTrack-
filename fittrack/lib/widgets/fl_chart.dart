import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartContainer extends StatelessWidget {
  final String title;
  final Widget chart;

  const ChartContainer({super.key, required this.title, required this.chart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TimeFilter(),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: chart,
          ),
        ],
      ),
    );
  }
}

class TimeFilter extends StatelessWidget {
  const TimeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FilterButton(title: 'Week', isActive: false),
        SizedBox(width: 10),
        FilterButton(title: 'Month', isActive: true),
        SizedBox(width: 10),
        FilterButton(title: 'Year', isActive: false),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  final bool isActive;

  const FilterButton({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4CAF50) : Colors.transparent,
        border: Border.all(color: const Color(0xFF4CAF50)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF4CAF50),
        ),
      ),
    );
  }
}

class LineChartSample1 extends StatelessWidget {
  const LineChartSample1({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 3),
              const FlSpot(2.6, 2),
              const FlSpot(4.9, 5),
              const FlSpot(6.8, 3.1),
              const FlSpot(8, 4),
              const FlSpot(9.5, 3),
              const FlSpot(11, 4),
            ],
            isCurved: true,
            color: const Color(0xFF4CAF50),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

class LineChartSample2 extends StatelessWidget {
  const LineChartSample2({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 2),
              const FlSpot(2.6, 3),
              const FlSpot(4.9, 2.5),
              const FlSpot(6.8, 2.8),
              const FlSpot(8, 2.2),
              const FlSpot(9.5, 2.7),
              const FlSpot(11, 2.3),
            ],
            isCurved: true,
            color: const Color(0xFF2196F3),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
