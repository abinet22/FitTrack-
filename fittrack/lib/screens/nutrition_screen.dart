import 'package:flutter/material.dart';
import 'package:fittrack/widgets/custome_nav_bar.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomNavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              NutritionSummaryCard(),
                              SizedBox(height: 16),
                              MealCardsGrid(),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: QuickAddCard(),
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

class NutritionSummaryCard extends StatelessWidget {
  const NutritionSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Nutrition Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            NutrientProgressBar(
              label: 'Calories',
              current: 1200,
              target: 2000,
              color: Colors.green,
            ),
            NutrientProgressBar(
              label: 'Protein',
              current: 45,
              target: 120,
              color: Colors.blue,
            ),
            NutrientProgressBar(
              label: 'Carbs',
              current: 150,
              target: 250,
              color: Colors.yellow,
            ),
            NutrientProgressBar(
              label: 'Fat',
              current: 35,
              target: 65,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class NutrientProgressBar extends StatelessWidget {
  final String label;
  final double current;
  final double target;
  final Color color;

  const NutrientProgressBar({
    super.key,
    required this.label,
    required this.current,
    required this.target,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (current / target * 100).toStringAsFixed(1);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                '$label (${current.toInt()}/${target.toInt()}${label == 'Calories' ? '' : 'g'})'),
            Text('$percentage%'),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: current / target,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(color),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class MealCardsGrid extends StatelessWidget {
  const MealCardsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        MealCard(
          title: 'Breakfast',
          totalCalories: 320,
          items: [
            MealItem(name: 'Oatmeal with Berries', calories: 250),
            MealItem(name: 'Green Tea', calories: 0),
            MealItem(name: 'Banana', calories: 70),
          ],
        ),
        MealCard(
          title: 'Lunch',
          totalCalories: 580,
          items: [
            MealItem(name: 'Grilled Chicken Salad', calories: 350),
            MealItem(name: 'Quinoa', calories: 120),
            MealItem(name: 'Olive Oil Dressing', calories: 110),
          ],
        ),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  final String title;
  final int totalCalories;
  final List items;

  const MealCard({
    super.key,
    required this.title,
    required this.totalCalories,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$totalCalories kcal',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map((item) => MealItemWidget(item: item)),
          ],
        ),
      ),
    );
  }
}

class MealItem {
  final String name;
  final int calories;

  const MealItem({required this.name, required this.calories});
}

class MealItemWidget extends StatelessWidget {
  final MealItem item;

  const MealItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name),
          Text('${item.calories} kcal'),
        ],
      ),
    );
  }
}

class QuickAddCard extends StatelessWidget {
  const QuickAddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Add',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Add Meal'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recent Items',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RecentItem(name: 'Greek Yogurt', calories: 130),
            const RecentItem(name: 'Apple', calories: 95),
            const RecentItem(name: 'Protein Shake', calories: 160),
          ],
        ),
      ),
    );
  }
}

class RecentItem extends StatelessWidget {
  final String name;
  final int calories;

  const RecentItem({
    super.key,
    required this.name,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(
            '$calories kcal',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
