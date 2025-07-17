import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: DatePicker(
            centerLeadingDate: true,
            minDate: DateTime.now().subtract(const Duration(days: 365)),
            maxDate: DateTime.now().add(const Duration(days: 365)),
            initialDate: DateTime.now(),
            selectedDate: _selectedDate,
            
            onDateSelected: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Your Habits for ${_selectedDate.toNormalizedDateString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        HabitListView(selectedDate: _selectedDate),
      ],
    );
  }
}
