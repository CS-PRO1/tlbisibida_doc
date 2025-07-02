abstract class DocRepo {
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
  Future<void> getCaseDetails(int id);
  Future<void> getcaseList(int id);
  Future<void> getComments(int id);
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
