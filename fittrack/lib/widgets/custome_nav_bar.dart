import 'package:flutter/material.dart';
import 'package:fittrack/screens/workout_screen.dart';
import 'package:fittrack/screens/progress_screen.dart';
import 'package:fittrack/screens/nutrition_screen.dart';
import 'package:fittrack/screens/community_screen.dart';
import 'package:fittrack/screens/home_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'FitTrack',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[400],
            ),
          ),
          Row(
            children: [
              NavBarItem(
                title: 'Dashboard',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                ),
              ),
              NavBarItem(
                title: 'Workouts',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorkoutScreen()),
                ),
              ),
              NavBarItem(
                title: 'Progress',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProgressScreen()),
                ),
              ),
              NavBarItem(
                title: 'Nutrition',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NutritionScreen()),
                ),
              ),
              NavBarItem(
                title: 'Community',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommunityScreen()),
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.green[400],
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
