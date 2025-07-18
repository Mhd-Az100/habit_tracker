import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/datepicker_cubit/datepicker_cubit.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            context.read<DatePickerCubit>().selectDate(selectedDate);
          },
          headerProps: const EasyHeaderProps(
            showHeader: false,
          ),
          dayProps: EasyDayProps(
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
    );
  }
}

