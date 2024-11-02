import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String stats;
  final double progress;

  const Exercise({
    required this.name,
    required this.stats,
    required this.progress,
  });
}

class ExerciseListItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseListItem({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[400],
            child: const Icon(
              Icons.fitness_center,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  exercise.stats,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: exercise.progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(
                    Colors.green[400]!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
