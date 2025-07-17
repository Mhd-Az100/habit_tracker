import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String title;

  const StatisticsCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(title),
      ),
    );
  }
}
