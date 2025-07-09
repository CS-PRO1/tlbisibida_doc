import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_patient_treatments.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_treatment_details.dart';

abstract class DocRepoPatients {
  DBPatientDetailsResponse? dbPatientDetailsResponse;
  DBTreatmentDetailsResponse? dbTreatmentDetailsResponse;
  DBPatientTreatmentsResponse? dbPatientTreatmentsResponse;

  Future<void> getPatientTreatment(int id);
  Future<void> getTreatmentDetails(int id);
  Future<void> getPatientPayments(int id);
  Future<void> getPatientPaymentsFromTo();
}
