import 'package:edu_platform/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: dividerGrey),
              ),
              padding: const EdgeInsets.only(bottom: 16),
              child: TableCalendar(
                locale: 'en_US',
                focusedDay: today,
                rowHeight: 48,
                firstDay: DateTime.utc(2022, 10, 16),
                lastDay: DateTime.utc(2025, 10, 16),
                calendarStyle: CalendarStyle(
                  tablePadding: const EdgeInsets.symmetric(horizontal: 16),
                  todayTextStyle: const TextStyle(fontSize: 16),
                  outsideTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: buttonTextGreen,
                  ),
                  weekendTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  defaultTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  todayDecoration: BoxDecoration(
                    border: Border.all(color: dividerGrey),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: whiteGrey,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(
                    fontSize: 16,
                    color: green,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  decoration: BoxDecoration(color: whiteGrey),
                  leftChevronIcon: Icon(
                    Icons.arrow_back,
                    color: green,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward,
                    color: green,
                  ),
                ),
                availableGestures: AvailableGestures.all,
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(fontSize: 15),
                  weekdayStyle: TextStyle(fontSize: 15),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: dividerGrey)),
                  ),
                ),
                daysOfWeekHeight: 52,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
              ),
            )
          ],
        ),
      ),
    );
  }
}
