import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/show_booked_appointment.dart';

// Base state
abstract class AppointmentsState {}

// Initial state
class AppointmentsInitial extends AppointmentsState {}

// Loading states
class AppointmentsLoading extends AppointmentsState {}

// Loaded states
class AppointmentsLoaded extends AppointmentsState {
  final List<Appointment> appointments;
  final String? message;

  AppointmentsLoaded(this.appointments, {this.message});
}

// Error states
class AppointmentsError extends AppointmentsState {
  final String message;
  final StackTrace? stackTrace;

  AppointmentsError(this.message, {this.stackTrace});
}
