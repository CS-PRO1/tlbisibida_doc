// bill_details_response.dart

class DBBillDetailsResponse {
  bool? status;
  int? successCode;
  BillDetailsData? billDetails; // The main bill_details object
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
        ? BillDetailsData.fromJson(json['bill_details'])
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

class BillDetailsData {
  Bill? bill; // The nested bill object
  List<BillCaseItem>? billCases; // The list of bill cases

  BillDetailsData({this.bill, this.billCases});

  BillDetailsData.fromJson(Map<String, dynamic> json) {
    bill = json['bill'] != null ? Bill.fromJson(json['bill']) : null;
    if (json['bill_cases'] != null) {
      billCases = <BillCaseItem>[];
      json['bill_cases'].forEach((v) {
        billCases!.add(BillCaseItem.fromJson(v));
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
}

class Bill {
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

  Bill({
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

  Bill.fromJson(Map<String, dynamic> json) {
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
  }
}

class BillCaseItem {
  int? id;
  int? billId;
  int? medicalCaseId;
  int? caseCost;
  String? createdAt;
  int? patientId;
  String? expectedDeliveryDate;
  String? fullName;

  BillCaseItem({
    this.id,
    this.billId,
    this.medicalCaseId,
    this.caseCost,
    this.createdAt,
    this.patientId,
    this.expectedDeliveryDate,
    this.fullName,
  });

  BillCaseItem.fromJson(Map<String, dynamic> json) {
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
  }
}
