import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/show_booked_appointment.dart';
import 'package:tlbisibida_doc/domain/repo/appointments/doc_repo_appointments.dart';
import 'package:tlbisibida_doc/presentation/appointments/cubits/appointments_states.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  final DocRepoAppointments repo;
  String? lastError;

  AppointmentsCubit(this.repo) : super(AppointmentsInitial());

  // Appointments List
  List<Appointment> appointments = [];

  Future<void> getAppointments({String? date}) async {
    emit(AppointmentsLoading());
    lastError = null;
    appointments.clear();

    try {
      await repo.getAppointments();
      final response = repo.dbAppointmentsResponse;
      if (response?.status == true && response?.appointments != null) {
        appointments =
            response!.appointments!.map((e) => e.todomain()).toList();
        emit(
            AppointmentsLoaded(appointments, message: response.successMessage));
      } else {
        lastError = 'لا توجد مواعيد محجوزة.';
        emit(AppointmentsError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(AppointmentsError(lastError!, stackTrace: stack));
    }
  }

  // Get appointments for a specific date
  Future<void> getAppointmentsForDate(String date) async {
    emit(AppointmentsLoading());
    lastError = null;
    appointments.clear();

    try {
      // Update the repository method to accept date parameter
      await repo.getAppointmentsForDate(date);
      final response = repo.dbAppointmentsResponse;
      if (response?.status == true && response?.appointments != null) {
        appointments =
            response!.appointments!.map((e) => e.todomain()).toList();
        emit(
            AppointmentsLoaded(appointments, message: response.successMessage));
      } else {
        lastError = 'لا توجد مواعيد محجوزة لهذا التاريخ.';
        emit(AppointmentsError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(AppointmentsError(lastError!, stackTrace: stack));
    }
  }

  // Clear appointments
  void clearAppointments() {
    appointments.clear();
    emit(AppointmentsInitial());
  }
}
