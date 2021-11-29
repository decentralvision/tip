import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tip/styles/colors.dart';

class _LineChart extends StatelessWidget {
  final dynamic barData;
  const _LineChart({this.barData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sample,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sample => LineChartData(
        lineTouchData: lineTouch,
        gridData: gridData,
        titlesData: titles,
        borderData: borderData,
        lineBarsData: [barData],
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
      );

  List<LineChartBarData> get lineBars => [
        lineChartBarData,
      ];

  LineTouchData get lineTouch => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titles => FlTitlesData(
        show: false,
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
            }
            return '';
          },
        ),
      );

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: false,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: false,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'SEPT';
            case 7:
              return 'OCT';
            case 12:
              return 'DEC';
          }
          return '';
        },
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: false,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData => LineChartBarData(
        isCurved: true,
        colors: [AppColors.primary],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(6.5, 2.8),
          FlSpot(9.2, 2),
          FlSpot(11, 2.4),
          FlSpot(13, 3.6),
        ],
      );
}

class Chart extends StatefulWidget {
  final String? amount;
  final LineChartBarData? barData;
  const Chart({this.amount, this.barData, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text(
                widget.amount!,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: _LineChart(barData: widget.barData,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
