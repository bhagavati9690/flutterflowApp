// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar2 extends StatefulWidget {
  const CustomCalendar2({
    super.key,
    this.width,
    this.height,
    required this.disabledDays,
    required this.preselectedDate,
  });

  final double? width;
  final double? height;
  final List<int> disabledDays;
  final DateTime preselectedDate;

  @override
  State<CustomCalendar2> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar2> {
  late DateTime _focusedDay;
  late DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.preselectedDate;
    _selectedDay = widget.preselectedDate; // Set the initial selected day
    _updateFlutterFlowState(widget.preselectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 400, // Provide a default height
      width: widget.width ?? 300, // Provide a default width
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          defaultTextStyle: const TextStyle(color: Colors.black),
          disabledTextStyle:
              const TextStyle(color: Colors.grey), // Disabled text
          weekendTextStyle:
              const TextStyle(color: Colors.black), // Weekend style
          outsideDaysVisible: true,
          outsideTextStyle:
              const TextStyle(color: Colors.grey), // Outside dates
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.black),
          weekendStyle: TextStyle(color: Colors.black),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          // Allow selection only for enabled days
          if (!widget.disabledDays.contains(selectedDay.weekday) &&
              !selectedDay
                  .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });

            // Update FlutterFlow state
            _updateFlutterFlowState(selectedDay);
          }
        },
        enabledDayPredicate: (day) =>
            !widget.disabledDays.contains(day.weekday) &&
            !day.isBefore(DateTime.now()
                .subtract(const Duration(days: 1))), // Disable past dates
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _updateFlutterFlowState(DateTime selectedDate) async {
    //print('Selected Date: $selectedDate');

    setState(() {
      // Update the FlutterFlow global state variable
      FFAppState().customCalendar2Selection =
          selectedDate; // Assuming FFAppState is the auto-generated class
    });
    // Trigger any additional FlutterFlow actions here
    //print('Update completed');
  }
}
