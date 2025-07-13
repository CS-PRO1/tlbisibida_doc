import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_booked_appointment.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_book_an_appointment.dart';

abstract class DocRepoAppointments {
  DBAppointmentsResponse? dbAppointmentsResponse;
  DBAvailableSlotsResponse? dbAvailableSlotsResponse;

  Future<void> getAppointments();
  Future<void> getAppointmentsForDate(String date);
  Future<void> getAvailableSlots({String? date, int? duration});

  // Future methods for additional functionality
  // Future<void> createAppointment(Map<String, dynamic> appointmentData);
  // Future<void> updateAppointment(int appointmentId, Map<String, dynamic> appointmentData);
  // Future<void> deleteAppointment(int appointmentId);
  // Future<void> getAppointmentsByPatient(int patientId);
  // Future<void> getAppointmentsByDateRange(String startDate, String endDate);
}
