import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/stamp/stamp_notifier.dart';
import 'package:table_calendar/table_calendar.dart';

class StampPage extends HookConsumerWidget {
  const StampPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stampNotifierProvider);
    final notifier = ref.watch(stampNotifierProvider.notifier);

    useEffect(() {
      Future<void> init() async {
        await notifier.fetchAll();
      }

      init();
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(title: const Text('読んだスタンプ')),
      body: RefreshIndicator(
        onRefresh: () async {
          await notifier.fetchAll();
        },
        child: SingleChildScrollView(
          child: Column(
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
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.4)),
                        ),
                      );
                    },
                    selectedBuilder: (context, day, focusedDay) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(color: Colors.brown),
                        ),
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
                  focusedDay: state.focusedDay!,
                  onDaySelected: (selectedDay, focusedDay) {
                    notifier.onDaySelected(
                      selectedDay: selectedDay,
                      focusedDay: focusedDay,
                      books: state.events?[selectedDay] ?? [],
                    );
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(state.selectedDay, day);
                  },
                  eventLoader: (date) {
                    return state.events?[date] ?? [];
                  },
                ),
              ),
              if (state.books != null) ...[
                for (int i = 0; i < state.books!.length; i++)
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                      state.books![i].largeImageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
