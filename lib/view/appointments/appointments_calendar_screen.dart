import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import 'dart:ui' as ui;

import '../../services/navigation/routes.dart';

ui.TextDirection direction = ui.TextDirection.ltr;

class Appointment {
  final String patientName;
  final DateTime startTime;
  final DateTime endTime;
  final String phoneNumber;
  final Color color;

  Appointment({
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.phoneNumber,
    required this.color,
  });
}

class AppointmentsCalendarScreen extends StatelessWidget {
  AppointmentsCalendarScreen({super.key});

  final EventController _eventController = EventController();

  final List<Appointment> _sampleAppointments = [
    Appointment(
      patientName: 'تحسين التحسيني',
      phoneNumber: '0987654321',
      startTime: DateTime.now().copyWith(
          hour: 13,
          minute: 30,
          second: 0,
          millisecond: 0,
          microsecond: 0),
      endTime: DateTime.now().copyWith(
          hour: 14,
          minute: 30,
          second: 0,
          millisecond: 0,
          microsecond: 0),
      color: Colors.green,
    ),
    Appointment(
      patientName: 'محمد حسام محمد السيد خليل',
      phoneNumber: '0987654321',
      startTime: DateTime.now().copyWith(
          hour: 17,
          minute: 30,
          second: 0,
          millisecond: 0,
          microsecond: 0),
      endTime: DateTime.now().copyWith(
          hour: 18,
          minute: 00,
          second: 0,
          millisecond: 0,
          microsecond: 0),
      color: Colors.green,
    ),
    Appointment(
      patientName: 'محمد سمبل',
      phoneNumber: '0987654321',
      startTime: DateTime.now().copyWith(
          hour: 15,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0),
      endTime: DateTime.now().copyWith(
          hour: 16,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0),
      color: Colors.orange,
    ),
  ];

  void _addAppointmentsToController() {
    _eventController.removeWhere((event) => true);
    for (var appointment in _sampleAppointments) {
      _eventController.add(CalendarEventData(
        date: appointment.startTime,
        startTime: appointment.startTime,
        endTime: appointment.endTime,
        title: appointment.patientName,
        event: appointment,
      ));
    }
  }

  Widget _buildAppointmentTile(DateTime date, List<CalendarEventData> events,
      Rect boundary, DateTime startDuration, DateTime endDuration) {
    if (events.isEmpty) {
      return const SizedBox();
    }

    final CalendarEventData event = events.first;
    final Appointment appointment = event.event as Appointment;

    return Container(
      margin: const EdgeInsets.only(top: 1.0, bottom: 1.0, right: 50, left: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: cyan50op,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 4.0,
            color: appointment.color,
            margin: const EdgeInsets.only(right: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  appointment.patientName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: cyan600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_rounded,
                      size: 16,
                      color: cyan500,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      appointment.phoneNumber,
                      style: TextStyle(color: cyan500),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _addAppointmentsToController();

    final DateTime initialDay = DateTime.now();

    return CalendarControllerProvider(
      controller: _eventController,
      child: Scaffold(
        backgroundColor: cyan50,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat.E('ar').format(initialDay) +
                    '، ' +
                    DateFormat.d('en').format(initialDay) +
                    ' ' +
                    DateFormat.MMM('ar').format(initialDay),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cyan500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: .5,
                width: 200,
                color: cyan400,
              ),
              const SizedBox(
                height: 15,
              ),
              Directionality(
                textDirection: direction,
                child: Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: DayView(
                      controller: _eventController,
                      showVerticalLine: true,
                      startHour: 8,
                      endHour: 20,
                      heightPerMinute: 2.5,
                      showHalfHours: true,
                      headerStyle: const HeaderStyle(
                          decoration: BoxDecoration(
                              color: cyan200,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)))),
                      initialDay: initialDay,
                      hourIndicatorSettings: HourIndicatorSettings(
                        color: cyan300,
                      ),
                      halfHourIndicatorSettings: HourIndicatorSettings(
                        dashWidth: 9,
                        dashSpaceWidth: 3,
                        color: cyan100,
                        lineStyle: LineStyle.dashed,
                      ),
                      eventTileBuilder: _buildAppointmentTile,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Changed to use the absolute path constant for clarity and robustness.
            context.push(addAppointmentRoute);
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