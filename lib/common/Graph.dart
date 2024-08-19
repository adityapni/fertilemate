import 'dart:developer';

import 'package:fertility_boost/common/SDP.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const appPrimaryTrans = Color(0x45F6F0EF);
const appTextGray_two = Color(0xFF656363);
const appColorCost = Color(0xff9dcd5a);

class horizontalChartGross extends StatelessWidget {
  final Color? barColor;
  final double? interval;
  final List<BarData> bardata;

  const horizontalChartGross(
      {super.key,
      this.barColor,
      required this.bardata,
      required this.interval});

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: appTextGray_two,
      fontWeight: FontWeight.normal,
      fontSize: SDP.sdp(9),
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget getTitless(double value, TitleMeta meta) {
    final style = TextStyle(
      color: appTextGray_two,
      fontWeight: FontWeight.w200,
      fontSize: SDP.sdp(9),
    );
    String text;
    log("valuevaluevalue===$value");
    log("meta.appliedInterval   ===${meta.appliedInterval}");
    log("meta.axisPosition}   ===  ${meta.axisPosition}");
    log("meta.axisSide}   ===      ${meta.axisSide}");
    log("meta.formattedValue}   ===${meta.formattedValue}");
    log("meta.parentAxisSize}   ===${meta.parentAxisSize}");
    log("meta.max}   ===           ${meta.max}");
    log("meta.min}   ===           ${meta.min}");
    log("meta.sideTitles}   ===    ${meta.sideTitles}");
    if (meta.max - value >= meta.appliedInterval) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 0,
        fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
        child: Wrap(
          children: [
            Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "\$"
                ""
                "${meta.formattedValue}",
                style: style),
          ],
        ),
      );
    } else {
      log("-------------  meta.max-value ===    ${meta.max - value}");
      log("-------------  meta.appliedInterval ===    ${meta.appliedInterval}");
      if (meta.max == value) {
        return SideTitleWidget(
          axisSide: meta.axisSide,
          space: 0,
          fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
          child: Wrap(
            children: [
              Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "\$"
                  ""
                  "${meta.formattedValue}",
                  style: style),
            ],
          ),
        );
      } else {
        return SideTitleWidget(axisSide: meta.axisSide, child: Text(''));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var Widgetheight = MediaQuery.of(context).size.height;
    var Widgetwidth = MediaQuery.of(context).size.width;
    print("11111111111111111111111111----------------$interval");
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.all(2),
          height: Widgetheight / 2.7,
          child: BarChart(
            BarChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                      sideTitles:
                          SideTitles(reservedSize: 0, showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    reservedSize: SDP.sdp(40),
                    showTitles: true,
                    getTitlesWidget: getTitles,
                  )),
                  rightTitles: AxisTitles(
                      sideTitles:
                          SideTitles(reservedSize: 0, showTitles: false)),
                  leftTitles: AxisTitles(
                      axisNameSize: 12,
                      sideTitles: SideTitles(
                          reservedSize: SDP.sdp(34),
                          showTitles: true,
                          getTitlesWidget: getTitless)),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barTouchData: BarTouchData(
                    enabled: true,
                    allowTouchBarBackDraw: true,
                    touchTooltipData:
                        BarTouchTooltipData(/*tooltipBgColor: Colors.grey*/),
                    touchExtraThreshold: EdgeInsets.all(3)),
                barGroups: [
                  for (int i = 0; i < bardata.length; i++)
                    BarChartGroupData(
                      x: bardata[i].xAxes,
                      groupVertically: true,
                      barRods: [
                        BarChartRodData(
                            toY: bardata[i].yAxes,
                            width: 40,
                            borderSide: BorderSide.none,
                            gradient:
                                RadialGradient(colors: [barColor!, barColor!]),
                            color: barColor),
                      ],
                    ),
                ]),
          ),
        ),
      ],
    );
  }
}

class BarData {
  BarData({
    required this.xAxes,
    required this.xText,
    required this.yAxes,
    required this.yText,
    required this.barWidth,
    required this.color,
  });

  late final String yText;
  late final String xText;
  late final int xAxes;
  late final double yAxes;
  late final double barWidth;
  late final Color color;

  BarData.fromJson(Map<String, dynamic> json) {
    yText = json['y_text'];
    xText = json['x_text'];
    xAxes = json['x_axes'];
    yAxes = json['y_axes'];
    barWidth = json['bar_width'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['x_text'] = xText;
    _data['y_text'] = yText;
    _data['x_axes'] = xAxes;
    _data['y_axes'] = yAxes;
    _data['bar_width'] = barWidth;
    _data['color'] = color;
    return _data;
  }
}
