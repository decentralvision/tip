import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tip/global_widgets/chart.dart';
import 'package:tip/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

class WalletPage extends StatelessWidget {
  bool isRunning = true;

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Total Balance:"),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "2938.56",
                style: TextStyle(fontSize: 36.0),
              ),
            ),
            const Text("Total Payout: 2527.07"),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 10,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text('Next Payout (BTC):'),
                      ),
                      Stack(
                        children: [
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width / 2.1,
                            animation: isRunning,
                            lineHeight: 10.0,
                            animationDuration: 3000,
                            percent: 1.0,
                            animateFromLastPercent: true,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.black26,
                            backgroundColor: Colors.black26,
                          ),
                          Shimmer.fromColors(
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width / 3.4,
                              animation: isRunning,
                              lineHeight: 10.0,
                              animationDuration: 3000,
                              percent: 1.0,
                              animateFromLastPercent: true,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.black26,
                              backgroundColor: Colors.black54,
                            ),
                            baseColor: Colors.black87,
                            highlightColor: Colors.black45,
                            direction: ShimmerDirection.ltr,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('0.003424'),
                        Text(
                          '11 Out 2020, 11 PM',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reward Grid',
                    style: TextStyle(fontSize: 20),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.487,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          RewardCard(
                              title: '@morum',
                              percentage: '16%',
                              amount: '421.23',
                              icon: const FaIcon(
                                FontAwesomeIcons.bitcoin,
                                size: 14,
                              ),
                              barData: LineChartBarData(
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
                              )),
                          RewardCard(
                              title: '@brunin',
                              percentage: '11%',
                              amount: '219.23',
                              icon: const FaIcon(
                                FontAwesomeIcons.ethereum,
                                size: 14,
                              ),
                              barData: LineChartBarData(
                                isCurved: true,
                                colors: [AppColors.primary],
                                barWidth: 4,
                                isStrokeCapRound: true,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                                spots: const [
                                  FlSpot(1, 1),
                                  FlSpot(3, 1.5),
                                  FlSpot(6, 1.1),
                                  FlSpot(9, 1.9),
                                  FlSpot(11, 1.8),
                                  FlSpot(13, 2.4),
                                ],
                              )),
                          RewardCard(
                              title: '@yero',
                              percentage: '7%',
                              amount: '131.59',
                              icon: const FaIcon(
                                FontAwesomeIcons.viacoin,
                                size: 14,
                              ),
                              barData: LineChartBarData(
                                isCurved: true,
                                colors: [AppColors.primary],
                                barWidth: 4,
                                isStrokeCapRound: true,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                                spots: const [
                                  FlSpot(1, 1),
                                  FlSpot(3, 2.1),
                                  FlSpot(5, 2.5),
                                  FlSpot(6.5, 3),
                                  FlSpot(9.2, 2.2),
                                  FlSpot(11, 3.2),
                                  FlSpot(13, 1.8),
                                ],
                              )),
                          RewardCard(
                            title: '@shark',
                            percentage: '3%',
                            amount: '43.17',
                            icon: const FaIcon(
                              FontAwesomeIcons.euroSign,
                              size: 14,
                            ),
                            barData: LineChartBarData(
                              isCurved: true,
                              colors: [AppColors.primary],
                              barWidth: 4,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                              spots: const [
                                FlSpot(1, 3.2),
                                FlSpot(3, 2.1),
                                FlSpot(5, 1.9),
                                FlSpot(6.5, 1.3),
                                FlSpot(9.2, 2.2),
                                FlSpot(11, 2.5),
                                FlSpot(13, 2.8),
                              ],
                            ),
                          ),
                          RewardCard(
                            title: '@zé',
                            percentage: '1%',
                            amount: '13.34',
                            icon: const FaIcon(
                              FontAwesomeIcons.dollarSign,
                              size: 14,
                            ),
                            barData: LineChartBarData(
                              isCurved: true,
                              colors: [AppColors.primary],
                              barWidth: 4,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                              spots: const [
                                FlSpot(1, 3.2),
                                FlSpot(3, 2.1),
                                FlSpot(5, 1.9),
                                FlSpot(6.5, 1.3),
                                FlSpot(9.2, 2.2),
                                FlSpot(11, 2.1),
                                FlSpot(13, 1.2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final String? title;
  final String? percentage;
  final String? amount;
  final dynamic? barData;
  final Widget? icon;

  const RewardCard({
    this.title,
    this.percentage,
    this.amount,
    this.barData,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon!,
              Text(
                title!,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                percentage!,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          Chart(
            amount: amount,
            barData: barData,
          ),
        ],
      ),
    );
  }
}
