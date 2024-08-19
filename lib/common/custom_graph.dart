import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../app/data/apis/api_models/get_temperature_history_model.dart';

class TemperatureChart extends StatelessWidget {
  final List<TemperatureHistoryData> temperatureList;

  const TemperatureChart({Key? key, required this.temperatureList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      title: ChartTitle(
        text: 'BBT Data analysis',
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
      ),
      legend: const Legend(isVisible: false),
      series: <LineSeries<TemperatureHistoryData, String>>[
        LineSeries<TemperatureHistoryData, String>(
          dataSource: temperatureList,
          xValueMapper: (TemperatureHistoryData dates, _) =>
              dates.dateTime != null ? dates.dateTime!.substring(0, 2) : '08',
          yValueMapper: (TemperatureHistoryData temperature, _) => int.parse(
              double.parse(temperature.temperature ?? "27").toInt().toString()),
          markerSettings: const MarkerSettings(
            color: Colors.red,
            shape: DataMarkerType.circle,
            isVisible: true,
            borderWidth: 0,
          ),
          dataLabelSettings: DataLabelSettings(
            showZeroValue: true,
            useSeriesColor: true,
            borderColor: Colors.red,
            isVisible: true,
            borderRadius: 20.px,
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 8.px,
                ),
          ),
        ),
      ],
    );
  }
}
