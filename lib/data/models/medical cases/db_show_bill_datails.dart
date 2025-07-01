// bill_details_response.dart

import '../../../domain/models/medical cases/show_bill_details.dart';

class DBBillDetailsResponse {
  bool? status;
  int? successCode;
  DBBillDetailsData? billDetails; // The main bill_details object
  String? successMessage;

  DBBillDetailsResponse({
    this.status,
    this.successCode,
    this.billDetails,
    this.successMessage,
  });

  DBBillDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    billDetails = json['bill_details'] != null
        ? DBBillDetailsData.fromJson(json['bill_details'])
        : null;
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (billDetails != null) {
      data['bill_details'] = billDetails!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBBillDetailsData {
  DBBill? bill; // The nested bill object
  List<DBBillCaseItem>? billCases; // The list of bill cases

  DBBillDetailsData({this.bill, this.billCases});

  DBBillDetailsData.fromJson(Map<String, dynamic> json) {
    bill = json['bill'] != null ? DBBill.fromJson(json['bill']) : null;
    if (json['bill_cases'] != null) {
      billCases = <DBBillCaseItem>[];
      json['bill_cases'].forEach((v) {
        billCases!.add(DBBillCaseItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bill != null) {
      data['bill'] = bill!.toJson();
    }
    if (billCases != null) {
      data['bill_cases'] = billCases!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  BillDetailsData toDomain() {
    return BillDetailsData(
      bill: bill?.toDomain(),
      billCases: billCases?.map((e) => e.toDomain()).toList(),
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBBillDetailsData fromDomain(BillDetailsData domain) {
    return DBBillDetailsData(
      bill: domain.bill != null ? DBBill.fromDomain(domain.bill!) : null,
      billCases:
          domain.billCases?.map((e) => DBBillCaseItem.fromDomain(e)).toList(),
    );
  }
}

class DBBill {
  int? id;
  String? billNumber;
  int? dentistId;
  int? labManagerId;
  String? creatorableType;
  int? creatorableId;
  int? totalCost;
  String? dateFrom;
  String? dateTo;
  String? createdAt;
  String? updatedAt;

  DBBill({
    this.id,
    this.billNumber,
    this.dentistId,
    this.labManagerId,
    this.creatorableType,
    this.creatorableId,
    this.totalCost,
    this.dateFrom,
    this.dateTo,
    this.createdAt,
    this.updatedAt,
  });

  DBBill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billNumber = json['bill_number'];
    dentistId = json['dentist_id'];
    labManagerId = json['lab_manager_id'];
    creatorableType = json['creatorable_type'];
    creatorableId = json['creatorable_id'];
    totalCost = json['total_cost'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bill_number'] = billNumber;
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    data['creatorable_type'] = creatorableType;
    data['creatorable_id'] = creatorableId;
    data['total_cost'] = totalCost;
    data['date_from'] = dateFrom;
    data['date_to'] = dateTo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  Bill toDomain() {
    return Bill(
      id: id,
      billNumber: billNumber,
      dentistId: dentistId,
      labManagerId: labManagerId,
      creatorableType: creatorableType,
      creatorableId: creatorableId,
      totalCost: totalCost,
      dateFrom: dateFrom,
      dateTo: dateTo,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBBill fromDomain(Bill domain) {
    return DBBill(
      id: domain.id,
      billNumber: domain.billNumber,
      dentistId: domain.dentistId,
      labManagerId: domain.labManagerId,
      creatorableType: domain.creatorableType,
      creatorableId: domain.creatorableId,
      totalCost: domain.totalCost,
      dateFrom: domain.dateFrom,
      dateTo: domain.dateTo,
      createdAt: domain.createdAt,
      updatedAt: domain.updatedAt,
    );
  }
}

class DBBillCaseItem {
  int? id;
  int? billId;
  int? medicalCaseId;
  int? caseCost;
  String? createdAt;
  int? patientId;
  String? expectedDeliveryDate;
  String? fullName;

  DBBillCaseItem({
    this.id,
    this.billId,
    this.medicalCaseId,
    this.caseCost,
    this.createdAt,
    this.patientId,
    this.expectedDeliveryDate,
    this.fullName,
  });

  DBBillCaseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billId = json['bill_id'];
    medicalCaseId = json['medical_case_id'];
    caseCost = json['case_cost'];
    createdAt = json['created_at'];
    patientId = json['patient_id'];
    expectedDeliveryDate = json['expected_delivery_date'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bill_id'] = billId;
    data['medical_case_id'] = medicalCaseId;
    data['case_cost'] = caseCost;
    data['created_at'] = createdAt;
    data['patient_id'] = patientId;
    data['expected_delivery_date'] = expectedDeliveryDate;
    data['full_name'] = fullName;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  BillCaseItem toDomain() {
    return BillCaseItem(
      id: id,
      billId: billId,
      medicalCaseId: medicalCaseId,
      caseCost: caseCost,
      createdAt: createdAt,
      patientId: patientId,
      expectedDeliveryDate: expectedDeliveryDate,
      fullName: fullName,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBBillCaseItem fromDomain(BillCaseItem domain) {
    return DBBillCaseItem(
      id: domain.id,
      billId: domain.billId,
      medicalCaseId: domain.medicalCaseId,
      caseCost: domain.caseCost,
      createdAt: domain.createdAt,
      patientId: domain.patientId,
      expectedDeliveryDate: domain.expectedDeliveryDate,
      fullName: domain.fullName,
    );
  }
}
