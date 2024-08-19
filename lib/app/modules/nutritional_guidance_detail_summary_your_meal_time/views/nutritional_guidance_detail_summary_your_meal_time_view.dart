import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../controllers/nutritional_guidance_detail_summary_your_meal_time_controller.dart';

class NutritionalGuidanceDetailSummaryYourMealTimeView
    extends GetView<NutritionalGuidanceDetailSummaryYourMealTimeController> {
  const NutritionalGuidanceDetailSummaryYourMealTimeView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(title: 'Summary Your Meal Time'),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createDataTable(),
            ),
          ],
        ));
  }

  DataTable createDataTable() {
    return DataTable(
        horizontalMargin: 0, columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      columnName(label: 'Date'),
      columnName(label: 'Meal'),
      columnName(label: 'Time'),
    ];
  }

  DataColumn columnName({required String label}) {
    return DataColumn(
      label: Text(
        label,
        style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
            fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
      ),
    );
  }

  List<DataRow> _createRows() {
    return [
      dataRow(
          dateTitle: '28/09/2022',
          mealTitle: 'Breakfast',
          timeTitle: '12.00 p.m.'),
      dataRow(
          dateTitle: '28/09/2022', mealTitle: 'Lunch', timeTitle: '12.00 p.m.'),
      dataRow(
          dateTitle: '28/09/2022',
          mealTitle: 'Dinner',
          timeTitle: '12.00 p.m.'),
      dataRow(
          dateTitle: '28/09/2022',
          mealTitle: 'Breakfast',
          timeTitle: '12.00 p.m.'),
    ];
  }

  dataRow({
    required String dateTitle,
    required String mealTitle,
    required String timeTitle,
  }) {
    return DataRow(cells: [
      dataCell(title: dateTitle),
      dataCell(title: mealTitle),
      dataCell(title: timeTitle),
    ]);
  }

  dataCell({required String title}) {
    return DataCell(
      Text(
        title,
        style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
            fontSize: 10.px,),
      ),
    );
  }
}
