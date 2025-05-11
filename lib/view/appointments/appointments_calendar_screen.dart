import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
// Assuming these imports provide necessary constants like cyan50, cyan500, etc.
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:intl/intl.dart';
// Assuming these imports are for navigation, keep them as is
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'dart:ui' as UI;

// Define the text direction, keeping it outside the widget for simplicity
UI.TextDirection direction = UI.TextDirection.ltr;

// Define an Appointment class to hold appointment details
class Appointment {
  final String patientName;
  final DateTime startTime;
  final DateTime endTime;
  final String phoneNumber;
  final Color color; // Color for the vertical indicator

  Appointment({
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.phoneNumber,
    required this.color,
  });
}

// StatelessWidget version of the Appointments Calendar Screen
class AppointmentsCalendarScreen extends StatelessWidget {
  AppointmentsCalendarScreen({super.key});

  // Event controller for the DayView
  // Initialize directly as it's stateless
  final EventController _eventController = EventController();

  // Sample appointments (replace with your actual data fetching logic)
  // Initialize directly as it's stateless
  final List<Appointment> _sampleAppointments = [
    Appointment(
      patientName: 'تحسين التحسيني',
      phoneNumber: '0987654321',
      startTime: DateTime.now().copyWith(
          hour: 13,
          minute: 30,
          second: 0,
          millisecond: 0,
          microsecond: 0), // 1:30 PM today
      endTime: DateTime.now().copyWith(
          hour: 14,
          minute: 30,
          second: 0,
          millisecond: 0,
          microsecond: 0), // 2:30 PM today
      color: Colors.green, // Sample color
    ),
    Appointment(
      patientName: 'محمد حسام محمد السيد خليل',
      phoneNumber: '0987654321',
      startTime: DateTime.now().copyWith(
          hour: 17,
          minute: 30,
          second: 0,
          millisecond: 0,
          microsecond: 0), // 5:30 PM today
      endTime: DateTime.now().copyWith(
          hour: 18,
          minute: 00,
          second: 0,
          millisecond: 0,
          microsecond: 0), // 6:00 PM today
      color: Colors.green, // Sample color
    ),
    Appointment(
      patientName: 'محمد سمبل',
      phoneNumber: '0987654321',
      startTime: DateTime.now().copyWith(
          hour: 15,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0), // 3:00 PM today
      endTime: DateTime.now().copyWith(
          hour: 16,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0), // 4:00 PM today
      color: Colors.orange, // Sample color
    ),
    // Add more appointments as needed, tied to a specific date or relative to DateTime.now()
  ];

  // Function to add appointments to the event controller
  // Called once during initialization for stateless widget
  void _addAppointmentsToController() {
    _eventController.removeWhere((event) => true); // Clear existing events
    for (var appointment in _sampleAppointments) {
      _eventController.add(CalendarEventData(
        date: appointment.startTime,
        startTime: appointment.startTime,
        endTime: appointment.endTime,
        title: appointment.patientName, // Use patient name as title
        event: appointment, // Store the full appointment object
      ));
    }
  }

  // Custom builder for appointment tiles
  Widget _buildAppointmentTile(DateTime date, List<CalendarEventData> events,
      Rect boundary, DateTime startDuration, DateTime endDuration) {
    if (events.isEmpty) {
      return SizedBox(); // Should not happen if events are properly added
    }

    // Assuming one event per tile for simplicity based on the image
    final CalendarEventData event = events.first;
    final Appointment appointment =
        event.event as Appointment; // Cast back to Appointment object

    return Container(
      margin: EdgeInsets.only(top: 1.0, bottom: 1.0, right: 50, left: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: cyan50op,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Colored vertical indicator
          Container(
            width: 4.0,
            color: appointment.color,
            margin: EdgeInsets.only(right: 8.0),
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
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_rounded,
                      size: 16,
                      color: cyan500,
                    ),
                    SizedBox(
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
    // Add appointments to the controller when the widget is built
    // For a stateless widget with fixed data, this is sufficient.
    _addAppointmentsToController();

    // Define the initial day for the DayView and the displayed date
    final DateTime initialDay = DateTime.now();

    return CalendarControllerProvider(
      controller: _eventController, // Use the stateless event controller
      child: Scaffold(
        backgroundColor: cyan50, // Assuming cyan50 is defined in constants
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the initial date
              Text(
                DateFormat.E('ar').format(initialDay) +
                    '، ' +
                    DateFormat.d('en').format(initialDay) +
                    ' ' +
                    DateFormat.MMM('ar').format(initialDay),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cyan500), // Assuming cyan500 is defined
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: .5,
                width: 200,
                color: cyan400, // Assuming cyan400 is defined
              ),
              SizedBox(
                height: 15,
              ),
              // DayView widget within Directionality for text direction control
              Directionality(
                textDirection: direction, // Use the defined text direction
                child: Expanded(
                  child: SizedBox(
                    width: double.infinity, // Use full width
                    child: DayView(
                      controller:
                          _eventController, // Use the stateless event controller
                      showVerticalLine: true,
                      startHour: 8,
                      endHour: 20,
                      heightPerMinute: 2.5,
                      showHalfHours: true,
                      headerStyle: HeaderStyle(
                          decoration: BoxDecoration(
                              color: cyan200,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)))),
                      initialDay: initialDay, // Use the defined initial day

                      hourIndicatorSettings: HourIndicatorSettings(
                        color: cyan300, // Assuming cyan300 is defined
                      ),
                      halfHourIndicatorSettings: HourIndicatorSettings(
                        dashWidth: 9,
                        dashSpaceWidth: 3,
                        color: cyan100, // Assuming cyan100 is defined
                        lineStyle: LineStyle.dashed,
                      ),
                      eventTileBuilder: _buildAppointmentTile,
                      // Removed onDayChanged callback as it's a StatelessWidget
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Floating action button for navigation
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the add appointment route
            locator<NavigationService>().navigateTo(
                addAppointmentRoute); // Assuming addAppointmentRoute is defined
          },
          mini: true,
          backgroundColor: cyan400, // Assuming cyan400 is defined
          foregroundColor: white, // Assuming white is defined
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: cyan600, width: 1.5), // Assuming cyan600 is defined
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
