import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'dart:ui' as UI;

UI.TextDirection direction = UI.TextDirection.ltr;

class AppointmentsCalendarScreen extends StatelessWidget {
  AppointmentsCalendarScreen({super.key});
  DateTime currentdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: Scaffold(
        backgroundColor: cyan50,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat.E('ar').format(currentdate) +
                      '، ' +
                      DateFormat.d('en').format(currentdate) +
                      ' ' +
                      DateFormat.MMM('ar').format(currentdate),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: cyan500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: .5,
                  width: 200,
                  color: cyan400,
                ),
                SizedBox(
                  height: 15,
                ),
                CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2025, 1, 1),
                  lastDate: DateTime(2030, 12, 31),
                  onDateSelected: (date) =>
                      print(DateFormat.MMMEd().format(date)),
                  leftMargin: 20,
                  monthColor: cyan600,
                  dayColor: cyan600,
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: cyan300,
                  dotColor: cyan200,

                  //dayNameColor: cyan300,
                  //selectableDayPredicate: (date) => date.day != 23,
                  locale: 'ar',
                ),
                Directionality(
                  textDirection: direction,
                  child: SizedBox(
                      height: 900,
                      width: 900,
                      child: DayView(
                        controller: EventController(),
                        showVerticalLine: true,
                        startHour: 8,
                        endHour: 20,
                        heightPerMinute: 3,
                        showHalfHours: true,
                        initialDay: currentdate,
                        headerStyle: HeaderStyle(
                            headerTextStyle: TextStyle(fontSize: 0),
                            headerMargin: EdgeInsets.all(0),
                            headerPadding: EdgeInsets.all(0),
                            decoration: BoxDecoration(shape: BoxShape.circle)),
                        //timeStringBuilder: (date, {secondaryDate}) => date.,
                        hourIndicatorSettings: HourIndicatorSettings(
                          color: cyan300,
                        ),
                        halfHourIndicatorSettings: HourIndicatorSettings(
                            dashWidth: 9,
                            dashSpaceWidth: 3,
                            color: cyan100,
                            lineStyle: LineStyle.dashed),
                      )),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            locator<NavigationService>().navigateTo(addAppointmentRoute);
          },
          mini: true,
          backgroundColor: cyan400,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: cyan600, width: 1.5),
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.add,
            size: 28,
          ),
        ),
      ),
    );
  }
}
