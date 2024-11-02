import 'package:flutter/material.dart';
import 'package:fittrack/widgets/fl_chart.dart';
import 'package:fittrack/widgets/custome_nav_bar.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: Column(
        children: [
          CustomNavBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  StatsGrid(),
                  SizedBox(height: 30),
                  ChartContainer(
                    title: 'Workout Progress',
                    chart: LineChartSample1(),
                  ),
                  SizedBox(height: 20),
                  ChartContainer(
                    title: 'Weight Progress',
                    chart: LineChartSample2(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 20,
      children: const [
        StatCard(title: 'Workouts Completed', value: '24'),
        StatCard(title: 'Total Time', value: '32h'),
        StatCard(title: 'Calories Burned', value: '12.4k'),
        StatCard(title: 'Current Streak', value: '7'),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4CAF50),
            ),
          ),
        ],
      ),
    );
  }
}
