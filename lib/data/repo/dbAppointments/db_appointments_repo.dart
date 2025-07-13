import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_booked_appointment.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_book_an_appointment.dart';
import 'package:tlbisibida_doc/domain/repo/appointments/doc_repo_appointments.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbAppointmentsRepo implements DocRepoAppointments {
  @override
  DBAppointmentsResponse? dbAppointmentsResponse;

  @override
  Future<void> getAppointments() async {
    return await DioHelper.getData(
            'dentist/patients/appointments/get-booked-appointments?date=2025-05-05',
            token: CacheHelper.get('token'))
        .then((value) {
      dbAppointmentsResponse = DBAppointmentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAppointments: ' + error.toString());
    });
  }

  @override
  Future<void> getAppointmentsForDate(String date) async {
    return await DioHelper.getData(
            'dentist/patients/appointments/get-booked-appointments?date=$date',
            token: CacheHelper.get('token'))
        .then((value) {
      dbAppointmentsResponse = DBAppointmentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAppointmentsForDate: ' + error.toString());
    });
  }

  @override
  DBAvailableSlotsResponse? dbAvailableSlotsResponse;

  @override
  Future<void> getAvailableSlots({String? date, int? duration}) async {
    final dateParam = date ?? '2025-5-27';
    final durationParam = duration ?? 30;

    return await DioHelper.getData(
            'dentist/patients/appointments/get-avilable-slots?date=$dateParam&duration=$durationParam',
            token: CacheHelper.get('token'))
        .then((value) {
      dbAvailableSlotsResponse = DBAvailableSlotsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAvailableSlots: ' + error.toString());
    });
  }
}
