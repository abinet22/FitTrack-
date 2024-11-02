import 'package:flutter/material.dart';
import 'package:fittrack/widgets/circular_percent_indicator.dart';
import 'package:fittrack/widgets/custome_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomNavBar(),
              SizedBox(height: 20),
              Dashboard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(),
          NavItems(),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.fitness_center, color: Color(0xFF2ecc71)),
        SizedBox(width: 10),
        Text(
          'FitTrack',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2ecc71),
          ),
        ),
      ],
    );
  }
}

class NavItems extends StatelessWidget {
  NavItems({super.key});
  final List<String> items = [
    'Dashboard',
    'Workouts',
    'Nutrition',
    'Progress',
    'Community'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) => NavItem(text: item)).toList(),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;

  const NavItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: const [
        ProgressCard(),
        WorkoutCard(),
        MealTrackerCard(),
      ],
    );
  }
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});
  @override
  Widget build(BuildContext context) {
    return const DashboardCard(
      title: "Today's Progress",
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 75,
            lineWidth: 8,
            percent: 0.75,
            center: Text('75%'),
            progressColor: Color(0xFF2ecc71),
          ),
          SizedBox(height: 20),
          Expanded(child: StatsGrid()), // Use Expanded here
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
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      children: const [
        StatItem(title: '1,200', subtitle: 'Calories'),
        StatItem(title: '8,532', subtitle: 'Steps'),
        StatItem(title: '45m', subtitle: 'Exercise'),
        StatItem(title: '2.5L', subtitle: 'Water'),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatItem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFecf0f1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(subtitle),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});
  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Upcoming Workouts',
      action: const AddButton(text: '+ Add'),
      child: ListView(
        shrinkWrap: true,
        children: const [
          WorkoutItem(
            title: 'Full Body Strength',
            time: '10:00 AM - 45 min',
            icon: Icons.timer,
          ),
          WorkoutItem(
            title: 'HIIT Cardio',
            time: '4:00 PM - 30 min',
            icon: Icons.directions_run,
          ),
        ],
      ),
    );
  }
}

class WorkoutItem extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;

  const WorkoutItem({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(time),
    );
  }
}

class MealTrackerCard extends StatelessWidget {
  const MealTrackerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return const DashboardCard(
      title: 'Meal Tracker',
      action: AddButton(text: '+ Log Meal'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MealCard(meal: 'Breakfast', calories: 320),
          MealCard(meal: 'Lunch', calories: 450),
          MealCard(meal: 'Dinner', calories: 430),
        ],
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String meal;
  final int calories;

  const MealCard({super.key, required this.meal, required this.calories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFecf0f1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(meal, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('$calories cal'),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? action;

  const DashboardCard({
    super.key,
    required this.title,
    required this.child,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                if (action != null) action!,
              ],
            ),
            const SizedBox(height: 15),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final String text;

  const AddButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF2ecc71), // Use backgroundColor instead of primary
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(text),
    );
  }
}
