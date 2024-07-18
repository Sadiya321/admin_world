import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/strings.dart';
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
        height: 280,
         
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.graphbg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: _Header(),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: _LineChartWidget(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'No of Users',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: const [
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
    );
  }
}

class _LineChartWidget extends StatelessWidget {
  const _LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return '0';
                
                case 100:
                  return '100';
                case 200:
                  return '200';
                case 300:
                  return '300';
                case 400:
                  return '400';
                case 500:
                  return '500';
                default:
                  return '';
              }
            },
            interval: 50,
            getTextStyles: (context, value) => const TextStyle(
              fontSize: 10,
            ),
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitles: (value) {
              return _getMonth(value.toInt());
            },
            getTextStyles: (context, value) => const TextStyle(
              fontSize: 10,
            ),
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
        minY: 0,  // Change this to 0
        maxY: 500,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 100),
              FlSpot(1, 300),
              FlSpot(2, 250),
              FlSpot(3, 220),
              FlSpot(4, 200),
              FlSpot(5, 300),
              FlSpot(6, 350),
              FlSpot(7, 400),
              FlSpot(8, 450),
              FlSpot(9, 500),
              FlSpot(10, 400),
              FlSpot(11, 350),
            ],
            colors: [Colors.red],
          ),
          _buildLineChartBarData(
            spots: const [
              FlSpot(0, 80),
              FlSpot(1, 200),
              FlSpot(2, 150),
              FlSpot(3, 160),
              FlSpot(4, 200),
              FlSpot(5, 240),
              FlSpot(6, 290),
              FlSpot(7, 340),
              FlSpot(8, 360),
              FlSpot(9, 400),
              FlSpot(10, 450),
              FlSpot(11, 320),
            ],
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  LineChartBarData _buildLineChartBarData({
    required List<FlSpot> spots,
    required Color color,
  }) {
    return LineChartBarData(
      spots: spots,
      isCurved: false,
      colors: [color],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) =>
            FlDotCirclePainter(
          radius: 3,
          color: color,
          strokeWidth: 0,
          strokeColor: Colors.transparent,
          
        ),
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          color.withOpacity(0.3),
          Colors.transparent,
        ],
        gradientColorStops: [0.3, 1.0],
        gradientFrom: const Offset(0, 0),
        gradientTo: const Offset(0, 1),
      ),
    );
    
  }

  String _getMonth(int value) {
    switch (value) {
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
  }
}





class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    TextStyle smallTextStyle = isSmallScreen ? blacksmallTextStyle : normalTextStyle;

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
          style: smallTextStyle,
        ),
      ],
    );
  }
}

// Placeholder styles
const TextStyle blacksmallTextStyle = TextStyle(fontSize: 10, color: Colors.black);
const TextStyle normalTextStyle = TextStyle(fontSize: 14, color: Colors.black);
