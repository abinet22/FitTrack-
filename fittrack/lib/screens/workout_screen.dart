import 'package:flutter/material.dart';
import 'package:fittrack/widgets/custome_nav_bar.dart';
import 'package:fittrack/widgets/exercise_list.dart';
import 'package:fittrack/widgets/work_out.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomNavBar(),
          Expanded(
            child: Container(
              color: const Color(0xFFF5F6FA),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.2,
                  children: const [
                    WorkoutCard(
                      title: 'Full Body Strength',
                      exercises: [
                        Exercise(
                          name: 'Barbell Squats',
                          stats: '4 sets × 12 reps',
                          progress: 0.75,
                        ),
                        Exercise(
                          name: 'Bench Press',
                          stats: '3 sets × 10 reps',
                          progress: 0.5,
                        ),
                        Exercise(
                          name: 'Deadlifts',
                          stats: '4 sets × 8 reps',
                          progress: 0.25,
                        ),
                      ],
                    ),
                    WorkoutCard(
                      title: 'HIIT Cardio',
                      exercises: [
                        Exercise(
                          name: 'High Knees',
                          stats: '45 seconds × 3 rounds',
                          progress: 0.0,
                        ),
                        Exercise(
                          name: 'Burpees',
                          stats: '30 seconds × 3 rounds',
                          progress: 0.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
