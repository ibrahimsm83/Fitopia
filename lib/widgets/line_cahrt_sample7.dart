import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/index_manager.dart';

class LineChartSample7 extends StatelessWidget {
  LineChartSample7({
    super.key,
    Color? line1Color,
    Color? line2Color,
    Color? betweenColor,
  })  : line1Color = line1Color ?? AppColors.contentColorGreen,
        line2Color = line2Color ?? AppColors.contentColorRed,
        betweenColor =
            betweenColor ?? AppColors.contentColorRed.withOpacity(0.5);

  final Color line1Color;
  final Color line2Color;
  final Color betweenColor;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'SUN';
        break;
      case 1:
        text = 'MON';
        break;
      case 2:
        text = 'TUE';
        break;
      case 3:
        text = 'WED';
        break;
      case 4:
        text = 'THU';
        break;
      case 5:
        text = 'FRI';
        break;
      case 6:
        text = 'SAT';
        //break;
        // case 7:
        //   text = 'Aug';
        //   break;
        // case 8:
        //   text = 'Sep';
        //   break;
        // case 9:
        //   text = 'Oct';
        //   break;
        // case 10:
        //   text = 'Nov';
        //   break;
        // case 11:
        //   text = 'Dec';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      //fontWeight: FontWeight.,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 1:
        text = '0';
        break;
      case 2:
        text = '100';
        break;
      case 3:
        text = '200';
        break;
      case 4:
        text = '300';
        break;
      case 5:
        text = '400';
        break;
      // case 6:
      //   text = '600';
      //   break;

      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text, style: style),
    );
  }

  // Widget leftTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(fontSize: 10);

  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     child: Text(
  //       value.toString(), //'\$ ${value + 0.5}',
  //       style: style,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 18,
          top: 10,
          bottom: 4,
        ),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 1),
                  FlSpot(0.8, 4.5),
                  FlSpot(1.5, 2),
                  FlSpot(2.2, 4.2),
                  FlSpot(2.9, 1.9),
                  FlSpot(3.2, 4.3),
                  FlSpot(4.0, 2.2),
                  FlSpot(5.0, 4.4),
                  // FlSpot(8, 4),
                  // FlSpot(9, 6),
                  // FlSpot(10, 6),
                  // FlSpot(11, 7),
                ],
                isCurved: true,
                barWidth: 2,
                color: line1Color,
                dotData: const FlDotData(
                  show: false,
                ),
              ),
              LineChartBarData(
                spots: const [
                  FlSpot(0, 5),
                  FlSpot(1, 3),
                  FlSpot(2, 4),
                  FlSpot(3, 2),
                  FlSpot(4, 3),
                  FlSpot(5, 4),
                  //     FlSpot(6, 5),
                  //     // FlSpot(7, 3),
                  //     // FlSpot(8, 1),
                  //     // FlSpot(9, 8),
                  //     // FlSpot(10, 1),
                  //     // FlSpot(11, 3),
                ],
                isCurved: false,
                barWidth: 2,
                color: line2Color,
                dotData: const FlDotData(
                  show: false,
                ),
              ),
            ],
            // betweenBarsData: [
            //   BetweenBarsData(
            //     fromIndex: 0,
            //     toIndex: 1,
            //     color: betweenColor,
            //   )
            // ],
            minY: 0,
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  interval: 1,
                  reservedSize: 36,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              // drawHorizontalLine: true
              //checkToShowHorizontalLine:
              // checkToShowHorizontalLine: (double value) {
              //   return value == 1 || value == 6 || value == 4 || value == 5;
              // },
            ),
          ),
        ),
      ),
    );
  }
}
