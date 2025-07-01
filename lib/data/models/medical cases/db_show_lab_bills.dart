// lab_bills_response.dart

import '../../../domain/models/medical cases/show_lab_bills.dart';

class DBLabBillsResponse {
  bool? status;
  int? successCode;
  DBLabBillsData? labBills; // Note: this is an object, not a list
  String? successMessage;

  DBLabBillsResponse({
    this.status,
    this.successCode,
    this.labBills,
    this.successMessage,
  });

  DBLabBillsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    labBills = json['lab_bills'] != null
        ? DBLabBillsData.fromJson(json['lab_bills'])
        : null;
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labBills != null) {
      data['lab_bills'] = labBills!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBLabBillsData {
  DBLabOverview? lab; // The nested lab object
  List<DBBillItem>? bills; // The list of bills

  DBLabBillsData({this.lab, this.bills});

  DBLabBillsData.fromJson(Map<String, dynamic> json) {
    lab = json['lab'] != null ? DBLabOverview.fromJson(json['lab']) : null;
    if (json['bills'] != null) {
      bills = <DBBillItem>[];
      json['bills'].forEach((v) {
        bills!.add(DBBillItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lab != null) {
      data['lab'] = lab!.toJson();
    }
    if (bills != null) {
      data['bills'] = bills!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  LabBillsData toDomain() {
    return LabBillsData(
      lab: lab?.toDomain(),
      bills: bills?.map((e) => e.toDomain()).toList(),
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBLabBillsData fromDomain(LabBillsData domain) {
    return DBLabBillsData(
      lab: domain.lab != null ? DBLabOverview.fromDomain(domain.lab!) : null,
      bills: domain.bills?.map((e) => DBBillItem.fromDomain(e)).toList(),
    );
  }
}

class DBLabOverview {
  int? id;
  String? labName;

  DBLabOverview({this.id, this.labName});

  DBLabOverview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lab_name'] = labName;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  // Since DBLabOverview and LabOverview are identical, the mapping is direct.
  LabOverview toDomain() {
    return LabOverview(
      id: id,
      labName: labName,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBLabOverview and LabOverview are identical, the mapping is direct.
  static DBLabOverview fromDomain(LabOverview domain) {
    return DBLabOverview(
      id: domain.id,
      labName: domain.labName,
    );
  }
}

class DBBillItem {
  int? id;
  int? totalCost;
  String? dateFrom;
  String? dateTo;
  String? createdAt;

  DBBillItem(
      {this.id, this.totalCost, this.dateFrom, this.dateTo, this.createdAt});

  DBBillItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalCost = json['total_cost'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_cost'] = totalCost;
    data['date_from'] = dateFrom;
    data['date_to'] = dateTo;
    data['created_at'] = createdAt;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  BillItem toDomain() {
    return BillItem(
      id: id,
      totalCost: totalCost,
      dateFrom: dateFrom,
      dateTo: dateTo,
      createdAt: createdAt,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBBillItem fromDomain(BillItem domain) {
    return DBBillItem(
      id: domain.id,
      totalCost: domain.totalCost,
      dateFrom: domain.dateFrom,
      dateTo: domain.dateTo,
      createdAt: domain.createdAt,
    );
  }
}
