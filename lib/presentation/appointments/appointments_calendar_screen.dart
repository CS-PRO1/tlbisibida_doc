import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/presentation/patients/components/dialogs/add_patient_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/presentation/appointments/cubits/appointments_cubit.dart';
import 'package:tlbisibida_doc/presentation/appointments/cubits/appointments_states.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/show_booked_appointment.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'dart:ui' as ui;

import '../../services/navigation/routes.dart';

ui.TextDirection direction = ui.TextDirection.ltr;

class CalendarAppointment {
  final String patientName;
  final DateTime startTime;
  final DateTime endTime;
  final String phoneNumber;
  final Color color;

  CalendarAppointment({
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.phoneNumber,
    required this.color,
  });
}

class AppointmentsCalendarScreen extends StatefulWidget {
  const AppointmentsCalendarScreen({super.key});

  @override
  State<AppointmentsCalendarScreen> createState() =>
      _AppointmentsCalendarScreenState();
}

class _AppointmentsCalendarScreenState
    extends State<AppointmentsCalendarScreen> {
  final EventController _eventController = EventController();
  DateTime _selectedDate = DateTime.now();
  final List<Color> _appointmentColors = [
    const Color.fromARGB(170, 76, 175, 79),
    const Color.fromARGB(170, 244, 67, 54),
    const Color.fromARGB(170, 255, 153, 0),
    const Color.fromARGB(170, 156, 39, 176),
    const Color.fromARGB(170, 33, 150, 243),
  ];

  @override
  void initState() {
    super.initState();
    _loadAppointmentsForDate(_selectedDate);
  }

  void _loadAppointmentsForDate(DateTime date) {
    final dateString = DateFormat('yyyy-MM-dd').format(date);
    context.read<AppointmentsCubit>().getAppointmentsForDate(dateString);
  }

  List<CalendarAppointment> _convertToCalendarAppointments(
      List<Appointment> appointments) {
    return appointments.asMap().entries.map((entry) {
      final appointment = entry.value;
      final colorIndex = entry.key % _appointmentColors.length;

      // Parse time strings to DateTime
      final date = DateTime.parse(appointment.date!);
      final timeFrom = appointment.timeFrom!.split(':');
      final timeTo = appointment.timeTo!.split(':');

      final startTime = DateTime(
        date.year,
        date.month,
        date.day,
        int.parse(timeFrom[0]),
        int.parse(timeFrom[1]),
      );

      final endTime = DateTime(
        date.year,
        date.month,
        date.day,
        int.parse(timeTo[0]),
        int.parse(timeTo[1]),
      );

      return CalendarAppointment(
        patientName: appointment.patientName ?? 'غير محدد',
        startTime: startTime,
        endTime: endTime,
        phoneNumber: appointment.patientPhone ?? 'غير محدد',
        color: _appointmentColors[colorIndex],
      );
    }).toList();
  }

  void _addAppointmentsToController(List<CalendarAppointment> appointments) {
    _eventController.removeWhere((event) => true);
    for (var appointment in appointments) {
      _eventController.add(CalendarEventData(
        date: appointment.startTime,
        startTime: appointment.startTime,
        endTime: appointment.endTime,
        title: appointment.patientName,
        event: appointment,
      ));
    }
  }

  Widget _buildAppointmentTile(
    DateTime date,
    List<CalendarEventData> events,
    Rect boundary,
    DateTime startDuration,
    DateTime endDuration,
  ) {
    if (events.isEmpty) {
      return const SizedBox();
    }

    final CalendarEventData event = events.first;
    final CalendarAppointment appointment = event.event as CalendarAppointment;

    return Builder(builder: (context) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 2.0,
              color: appointment.color,
              margin: const EdgeInsets.only(right: 8.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 1.0, bottom: 1.0, right: 50, left: 8.0),
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 8.0, right: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(165, 241, 255, 253),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: appointment.color,
                child: IconButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => addPatientDialog(context,
                        name: appointment.patientName,
                        phoneNumber: appointment.phoneNumber),
                  ),
                  iconSize: 15,
                  splashColor: Colors.transparent,
                  style: ButtonStyle(elevation: WidgetStatePropertyAll(2)),
                  icon: Icon(
                    shadows: [],
                    color: white,
                    Icons.person_add_alt_1,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentsCubit, AppointmentsState>(
      listener: (context, state) {
        if (state is AppointmentsError) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is AppointmentsLoading) {
          return Scaffold(
            backgroundColor: cyan50,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        List<CalendarAppointment> calendarAppointments = [];
        if (state is AppointmentsLoaded) {
          calendarAppointments =
              _convertToCalendarAppointments(state.appointments);
        }

        _addAppointmentsToController(calendarAppointments);

        return CalendarControllerProvider(
          controller: _eventController,
          child: Scaffold(
            backgroundColor: cyan50,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedDate =
                                _selectedDate.subtract(const Duration(days: 1));
                          });
                          _loadAppointmentsForDate(_selectedDate);
                        },
                        icon: const Icon(Icons.chevron_left, color: cyan500),
                      ),
                      Text(
                        DateFormat.E('ar').format(_selectedDate) +
                            '، ' +
                            DateFormat.d('en').format(_selectedDate) +
                            ' ' +
                            DateFormat.MMM('ar').format(_selectedDate),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: cyan500),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedDate =
                                _selectedDate.add(const Duration(days: 1));
                          });
                          _loadAppointmentsForDate(_selectedDate);
                        },
                        icon: const Icon(Icons.chevron_right, color: cyan500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: .5,
                    width: 200,
                    color: cyan400,
                  ),
                  const SizedBox(height: 15),
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
                          initialDay: _selectedDate,
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
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
      },
    );
  }
}
