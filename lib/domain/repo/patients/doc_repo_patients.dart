import 'dart:typed_data';

import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_all_patients.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_patient_treatments.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_treatment_details.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patient_payments.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patients_payment_from_to.dart';

abstract class DocRepoPatients {
  DBPatientDetailsResponse? dbPatientDetailsResponse;
  DBTreatmentDetailsResponse? dbTreatmentDetailsResponse;
  DBPatientTreatmentsResponse? dbPatientTreatmentsResponse;
  DBPatientPaymentsResponse? dbPatientPaymentsResponse;
  DBPatientsPaymentsFromToResponse? dbPatientsPaymentsFromToResponse;
  DBPatientsResponse? dbAllPatientsResponse;

  Future<void> getPatientPayments(int id);
  Future<void> getPatientPaymentsFromTo();
  Future<void> getAllPatients({String? fullName, String? sortBy, int? page});
  Future<void> getPatientTreatment(int patientId);
  Future<void> getTreatmentDetails(int treatmentId);
  Future<void> getPatientDetails(int id);
  Future<Uint8List>? getPatientSessionPix(int id);
}
