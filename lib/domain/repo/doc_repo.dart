import 'package:tlbisibida_doc/data/models/secretary/db_secretaries.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_book_an_appointment.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_booked_appointment.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/data/models/bills/db_show_bill_details.dart';
import 'package:tlbisibida_doc/data/models/bills/db_show_lab_bills.dart';
import 'package:tlbisibida_doc/data/models/clinic%20scheduals/db_show_clinic_times.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_mylabs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_unsub_labs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_unsub_lab_datails.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_patient_treatments.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_treatment_details.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_rare_n_repeated_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_cats.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_items_log.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_quants_for_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_subcats.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_case_details.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_caseslist_from_lab.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_comments.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_show_labs-send%20case%20to%20lab.dart';
import 'package:tlbisibida_doc/data/models/operating%20payments/db_op_payments.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patient_payments.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patients_payment_from_to.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_doc_gains.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_operating.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_patients.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_subcat.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_treatments.dart';

abstract class DocRepo {
  //secretary
  DBSecretariesResponse? dbSecretariesResponse;

  //labs
  DBLabDetailsResponse? dbLabDetailsResponse;
  DBAllLabsResponse? dbAllLabsResponse;
  DBLabsResponse? dbLabsResponse;
  DBLabsJoinedResponse? dbLabsJoinedResponse;

  //appointment
  DBAppointmentsResponse? dbAppointmentsResponse;
  DBAvailableSlotsResponse? dbAvailableSlotsResponse;

  //bills
  DBBillDetailsResponse? dbBillDetailsResponse;
  DBLabBillsResponse? dbLabBillsResponse;

  //inventory
  DBCategoriesResponse? dbCategoriesResponse;
  DBItemsResponse? dbItemsResponse;
  DBRepeatedItemsResponse? dbRepeatedItemsResponse;
  DBItemQuantityHistoryResponse? dbItemQuantityHistoryResponse;
  DBSubCategoryRepositoriesResponse? dbSubCategoryRepositoriesResponse;

  //dent timing
  DBDentistScheduleResponse? dbDentistScheduleResponse;

  //statictics
  DBDoctorGainsStatisticsResponse? dbDoctorGainsStatisticsResponse;
  DBOperatingPaymentsStatisticsResponse? dbOperatingPaymentsStatisticsResponse;
  DBPatientStatisticsResponse? dbPatientStatisticsResponse;
  DBSubcategoryStatisticsResponse? dbSubcategoryStatisticsResponse;
  DBTreatmentsStatisticsResponse? dbTreatmentsStatisticsResponse;

//financce
  DBOperatingPaymentsResponse? dbOperatingPaymentsResponse;
  DBNonRepeatedItemsResponse? dbNonRepeatedItemsResponse;

//patients
  DBPatientDetailsResponse? dbPatientDetailsResponse;
  DBTreatmentDetailsResponse? dbTreatmentDetailsResponse;

  DBPatientPaymentsResponse? dbPatientPaymentsResponse;
  DBPatientsPaymentsFromToResponse? dbPatientsPaymentsFromToResponse;
  DBPatientTreatmentsResponse? dbPatientTreatmentsResponse;

  // Future<void> renew(int month, int id);
  // // Future<void> renewclinics(int month, int id);
  // Future<void> confirmlabs(int id);
  // Future<void> confirmclinics(int id);
  //////////////////////////////////////////** */
  ///
  ///
  ///   G E T
  ///
  ///
  ////////////////////////////////////////////////** */
  //////////////////////////////////////////** */
  ///
  ///
  ///   G E T
  ///
  ///
  ////////////////////////////////////////////////** */
  Future<void> getAvailableSlots();
  Future<void> getAppointments();

  Future<void> getPatientDetails(int id);
  Future<void> getBillDetails(int id);
  Future<void> getLabBills(int id);

  Future<void> getClinicTimes();
  Future<void> getMyLabs();
  Future<void> getAllLabs();

  Future<void> getAllLabDetails(int id);
  Future<void> getPatientTreatment(int id);
  Future<void> getTreatmentDetails(int id);
  // Future<BillDetailsResponse> getBillDetail();
  // Future<LabBillsResponse> getLabBill();

  Future<void> getLabsListForChoice();
  Future<void> getOpPayments();

  Future<void> getPatientPayments(int id);

  Future<void> getPatientPaymentsFromTo();
  Future<void> getSecretaries();
  Future<void> getDocGainsStatistics();
  Future<void> getOpPaymentsStatistics();
  Future<void> getPatientsStatistics();
  Future<void> getSubCatStatistics();
  Future<void> getTreatmentStatistics();
  Future<void> getRareItems();
  Future<void> getCats();
  Future<void> getItemsLog();

  Future<void> getItems(int id);
  Future<void> getQuantities(int id);
  Future<void> getSubCats(int id);

  //////////////////////////////////////////** */
  ///
  ///
  ///   P O S T
  ///
  ///
  ////////////////////////////////////////////////** */
  //////////////////////////////////////////** */
  ///
  ///
  ///   P O S T
  ///
  ///
  ////////////////////////////////////////////////** */
  Future<bool> postAddSecretary(String firstName, String lastName, String phone,
      String email, String attendenceTime, String address);
  //////////////////////////////////////////** */
  ///
  ///
  ///   U P D A T E
  ///
  ///
  ////////////////////////////////////////////////** */
  //////////////////////////////////////////** */
  ///
  ///
  ///   U P D A T E
  ///
  ///
  ////////////////////////////////////////////////** */
  Future<bool> updateSecretary(int id, String firstName, String lastName,
      String phone, String email, String attendenceTime, String address);

  //////////////////////////////////////////** */
  ///
  ///
  ///   D E L E T E
  ///
  ///
  ////////////////////////////////////////////////** */
  //////////////////////////////////////////** */
  ///
  ///
  ///   D E L E T E
  ///
  ///
  ////////////////////////////////////////////////** */
  Future<bool> delSecretary(int id);
}
