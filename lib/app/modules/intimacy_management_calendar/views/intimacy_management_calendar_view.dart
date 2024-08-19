import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/intimacy_management_calendar_controller.dart';

class IntimacyManagementCalendarView
    extends GetView<IntimacyManagementCalendarController> {
  const IntimacyManagementCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final event = CalendarEventData(
              date: DateTime(2023, 12, 16),
              endDate: DateTime(2023, 12, 17),
              startTime: DateTime(2023, 12, 17),
              endTime: DateTime(2023, 12, 17),
              event: "Event 1",
              title: 'mahendra',
              description: 'sfghkursg');
          print('event::::::::::::::${event}');
          CalendarControllerProvider.of(context).controller.add(event);
        },
      ),
      body: WeekView(
        controller: EventController(),
        eventTileBuilder: (date, events, boundry, start, end) {
          // Return your widget to display as event tile.
          return Container();
        },
        fullDayEventBuilder: (events, date) {
          // Return your widget to display full day event view.
          return Container();
        },
        weekNumberBuilder: (firstDayOfWeek) => Container(color: Colors.red),
        timeLineWidth: 80,
        showLiveTimeLineInAllDays: true,
        // To display live time line in all pages in week view.
        // width: 400, // width of week view.
        minDay: DateTime(1990),
        maxDay: DateTime(2050),
        initialDay: DateTime(2021),
        heightPerMinute: 1,
        // height occupied by 1 minute time span.
        eventArranger: SideEventArranger(),
        // To define how simultaneous events will be arranged.
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
        // startDay: WeekDays.monday, // To change the first day of the week.
      ),
    );
  }
  // List<Meeting> _getDataSource() {
  //   final List<Meeting> meetings = <Meeting>[];
  //   return meetings;
  // }
}
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }
//
//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }
//
//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }
//
//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments![index];
//     late final Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }
//     return meetingData;
//   }
// }
//
// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//
//
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
//       this.color ,this.attachmentCount,this.commentCount,this.projectName);
//
//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;
//   String attachmentCount;
//   String commentCount;
//   String projectName;
//
//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;
//
//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;
//
//   /// Background which is equivalent to color property of [Appointment].
//   Color background;
//   Color color;
//
//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }
