import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_all_patients.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_patient_treatments.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_treatment_details.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patient_payments.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patients_payment_from_to.dart';
import 'package:tlbisibida_doc/domain/repo/patients/doc_repo_patients.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbPatientsRepo extends DocRepoPatients {
  @override
  DBPatientDetailsResponse? dbPatientDetailsResponse;
  Future<void> getPatientDetails(int id) async {
    return await DioHelper.getData('dentist/patients/show-patient/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbPatientDetailsResponse = DBPatientDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientDetails: ' + error.toString());
    });
  }

  @override
  DBPatientPaymentsResponse? dbPatientPaymentsResponse;
  Future<void> getPatientPayments(int id) async {
    return await DioHelper.getData('dentist/patients-payments/get-history/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbPatientPaymentsResponse =
          DBPatientPaymentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientPayments: ' + error.toString());
    });
  }

  @override
  DBPatientsPaymentsFromToResponse? dbPatientsPaymentsFromToResponse;
  Future<void> getPatientPaymentsFromTo() async {
    return await DioHelper.getData('dentist/patients-payments/get-all-ordered',
            token: CacheHelper.get('token'))
        .then((value) {
      dbPatientsPaymentsFromToResponse =
          DBPatientsPaymentsFromToResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientPaymentsFromTo: ' + error.toString());
    });
  }

  @override
  DBPatientTreatmentsResponse? dbPatientTreatmentsResponse;
  Future<void> getPatientTreatment(int id) async {
    return await DioHelper.getData(
            'dentist/treatments/show-patient-treatments/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbPatientTreatmentsResponse =
          DBPatientTreatmentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientTreatment: ' + error.toString());
    });
  }

  @override
  DBTreatmentDetailsResponse? dbTreatmentDetailsResponse;
  Future<void> getTreatmentDetails(int id) async {
    return await DioHelper.getData(
            'dentist/treatments/show-treatment-details/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbTreatmentDetailsResponse =
          DBTreatmentDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getTreatmentDetails: ' + error.toString());
    });
  }

  @override
  DBPatientsResponse? dbAllPatientsResponse;
  Future<void> getAllPatients(
      {String? fullName, String? sortBy, int? page}) async {
    Map<String, dynamic> queryParameters = {};

    if (fullName != null && fullName.isNotEmpty) {
      queryParameters['full_name'] = fullName;
    }

    if (sortBy != null && sortBy.isNotEmpty) {
      queryParameters['sort_by'] = sortBy;
    }

    if (page != null && page > 1) {
      queryParameters['page'] = page;
    }

    return await DioHelper.getData('dentist/patients',
            query: queryParameters, token: CacheHelper.get('token'))
        .then((value) {
      dbAllPatientsResponse = DBPatientsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAllPatients: ' + error.toString());
    });
  }
}
