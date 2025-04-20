import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});
  DateTime currentdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: Scaffold(
          appBar: TopNavigationBar(),
          backgroundColor: cyan50,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Schedule',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat.MMMMEEEEd().format(currentdate),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                    locale: 'en_ISO',
                  ),
                  SizedBox(
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
                ],
              ),
            ),
          )),
    );
  }
}
