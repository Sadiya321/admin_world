import 'package:admin_world/const/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.graphbg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'No of Users',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),SizedBox(width: 320,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start, 
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Indicator(
                       color: Colors.red,
                       text: 'Total Number of Users Over Month',
                     ),
                     SizedBox(width: 30),
                     Indicator(
                       color: Colors.green,
                       text: 'Active Users Over Month',
                     ),
                   ],
                 ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          return value.toInt().toString();
                        },
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Jan';
                            case 1:
                              return 'Feb';
                            case 2:
                              return 'Mar';
                            case 3:
                              return 'Apr';
                            case 4:
                              return 'May';
                            case 5:
                              return 'Jun';
                            case 6:
                              return 'Jul';
                            case 7:
                              return 'Aug';
                            case 8:
                              return 'Sep';
                            case 9:
                              return 'Oct';
                            case 10:
                              return 'Nov';
                            case 11:
                              return 'Dec';
                            default:
                              return '';
                          }
                        },
                      ),
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 100),
                          FlSpot(1, 50),
                          FlSpot(2, 200),
                          FlSpot(3, 150),
                          FlSpot(4, 250),
                          FlSpot(5, 300),
                          FlSpot(6, 350),
                          FlSpot(7, 400),
                          FlSpot(8, 450),
                          FlSpot(9, 500),
                          FlSpot(10, 600),
                          FlSpot(11, 700),
                        ],
                        isCurved: true,
                        colors: [Colors.red],
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [Colors.red.withOpacity(0.3)],
                        ),
                      ),
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 80),
                          FlSpot(1, 30),
                          FlSpot(2, 150),
                          FlSpot(3, 120),
                          FlSpot(4, 200),
                          FlSpot(5, 240),
                          FlSpot(6, 290),
                          FlSpot(7, 320),
                          FlSpot(8, 350),
                          FlSpot(9, 400),
                          FlSpot(10, 450),
                          FlSpot(11, 500),
                        ],
                        isCurved: true,
                        colors: [Colors.green],
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [Colors.green.withOpacity(0.3)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
