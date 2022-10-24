import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/entity/bookshelf_history.dart';

class BookshelfHistoryBarChart extends StatelessWidget {
  const BookshelfHistoryBarChart({
    required this.bookshelfHistory,
    Key? key,
  }) : super(key: key);

  final List<BookshelfHistory> bookshelfHistory;

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, double> totalReadBook = {};
    for (var i = 1; i <= 12; i++) {
      //MEMO: とりあえず今年のだけ集計
      totalReadBook.addEntries(<DateTime, double>{
        DateTime(DateTime.now().year, i, 1, 0, 0): 0
      }.entries);
    }

    for (final e in bookshelfHistory) {
      totalReadBook[DateTime(e.date!.year, e.date!.month, 1, 0, 0)] =
          totalReadBook[DateTime(e.date!.year, e.date!.month, 1, 0, 0)]! +
              1; // MEMO:インクリ演算子使うとlintにひっかかる
    }

    return AspectRatio(
      aspectRatio: 1.8,
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          bottom: 10,
          left: 2.5,
          right: 20,
        ),
        child: BarChart(
          BarChartData(
            maxY: 20,
            minY: 0,
            alignment: BarChartAlignment.spaceBetween,
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35,
                  getTitlesWidget: (x, y) {
                    return SideTitleWidget(
                      axisSide: y.axisSide,
                      space: 10.0,
                      child: Text(
                        '${x.toInt().toString()}月',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (x, y) {
                    return SideTitleWidget(
                      axisSide: y.axisSide,
                      child: Text(
                        x == 0 ? '' : x.toInt().toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: false,
              checkToShowHorizontalLine: (value) => value % 10 == 0,
              getDrawingHorizontalLine: (value) => FlLine(
                color: const Color.fromARGB(255, 214, 81, 9),
                strokeWidth: 1,
              ),
              drawVerticalLine: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            groupsSpace: 4,
            barGroups: _getData(totalReadBook: totalReadBook),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getData({
    required Map<DateTime, double> totalReadBook,
  }) {
    List<BarChartGroupData> barChartGroupDataTable = [];

    totalReadBook.forEach((key, value) {
      final month = int.tryParse(DateFormat('M').format(key))!;

      barChartGroupDataTable.add(BarChartGroupData(
        x: month,
        barRods: [
          BarChartRodData(
            color: Colors.brown,
            toY: value,
            borderRadius: BorderRadius.zero,
          ),
        ],
      ));
    });

    return barChartGroupDataTable;
  }
}
