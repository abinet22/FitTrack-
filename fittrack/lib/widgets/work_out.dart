import 'package:flutter/material.dart';
import 'package:fittrack/widgets/exercise_list.dart';
import 'package:fittrack/widgets/start_button.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final List exercises;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
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
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                StartButton(onPressed: () {}),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: exercises.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ExerciseListItem(
                  exercise: exercises[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
