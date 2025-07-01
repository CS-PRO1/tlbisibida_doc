import '../../../domain/models/patients payments/patients_payment_from_to.dart';

class DBPatientsPaymentsFromToResponse {
  bool? status;
  int? successCode;
  List<DBPatientBalance>? patientsPayments;
  String? successMessage;

  DBPatientsPaymentsFromToResponse({
    this.status,
    this.successCode,
    this.patientsPayments,
    this.successMessage,
  });

  DBPatientsPaymentsFromToResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['patients_payments'] != null) {
      patientsPayments = <DBPatientBalance>[];
      json['patients_payments'].forEach((v) {
        patientsPayments!.add(DBPatientBalance.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (patientsPayments != null) {
      data['patients_payments'] =
          patientsPayments!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBPatientBalance {
  int? id;
  String? fullName;
  int? currentBalance;

  DBPatientBalance({
    this.id,
    this.fullName,
    this.currentBalance,
  });

  DBPatientBalance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    currentBalance = json['current_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['current_balance'] = currentBalance;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  // Since DBPatientBalance and PatientBalance are identical, the mapping is direct.
  PatientBalance toDomain() {
    return PatientBalance(
      id: id,
      fullName: fullName,
      currentBalance: currentBalance,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBPatientBalance and PatientBalance are identical, the mapping is direct.
  static DBPatientBalance fromDomain(PatientBalance domain) {
    return DBPatientBalance(
      id: domain.id,
      fullName: domain.fullName,
      currentBalance: domain.currentBalance,
    );
  }
}
