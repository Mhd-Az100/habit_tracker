import 'package:flutter/material.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habit')),
      body: Center(child: Text('Habit Screen')),
    );
  }
}
