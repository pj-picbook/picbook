import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class StampPage extends StatefulWidget {
  const StampPage({Key? key}) : super(key: key);

  @override
  State<StampPage> createState() => _StampPageState();
}

class _StampPageState extends State<StampPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final sampleEvents = {
    DateTime.utc(2022, 9, 16): [
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6638/9784909566638.jpg?_ex=120x120',
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3217/9784267023217_1_4.jpg?_ex=120x120'
    ],
    DateTime.utc(2022, 9, 1): [
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6638/9784909566638.jpg?_ex=120x120',
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3217/9784267023217_1_4.jpg?_ex=120x120'
    ],
  };
  List<String> _selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('読んだスタンプ')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TableCalendar(
              locale: 'ja_JP',
              daysOfWeekHeight: 30,
              rowHeight: 60,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  final weekDays = {
                    1: 'げつ',
                    2: 'か',
                    3: 'すい',
                    4: 'もく',
                    5: 'きん',
                    6: 'ど',
                    7: 'にち',
                  };
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Text(weekDays[day.weekday].toString()),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Text(day.day.toString()),
                  );
                },
                outsideBuilder: (context, day, focusedDay) {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  );
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(color: Colors.lime, blurRadius: 40)
                        ]),
                    alignment: Alignment.topCenter,
                    child: Text(day.day.toString()),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: Text(day.day.toString()),
                  );
                },
                markerBuilder: (context, date, event) {
                  if (event.isNotEmpty) {
                    return Container(
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.deepOrange.shade700,
                        size: 32,
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.circle,
                        color: Colors.black.withOpacity(0.1),
                        size: 32,
                      ),
                    );
                  }
                },
              ),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2040, 1, 1),
              focusedDay: _focusedDay,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents = sampleEvents[selectedDay] ?? [];
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              eventLoader: (date) {
                return sampleEvents[date] ?? [];
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                final event = _selectedEvents[index];
                return Container(
                    padding: const EdgeInsets.all(60),
                    child: Image.network(
                      event,
                      fit: BoxFit.fill,
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
