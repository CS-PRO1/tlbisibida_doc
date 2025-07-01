import '../../../domain/models/bills/show_lab_bills.dart';
// import '../../../domain/models/dentist labs/show_unsub_labs.dart';

class DBLabBillsResponse {
  bool? status;
  int? successCode;
  DBLabBillsData? labBills;
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
  DBLabInfo? lab;
  List<DBBillDetails>? bills;

  DBLabBillsData({this.lab, this.bills});

  DBLabBillsData.fromJson(Map<String, dynamic> json) {
    lab = json['lab'] != null ? DBLabInfo.fromJson(json['lab']) : null;
    if (json['bills'] != null) {
      bills = <DBBillDetails>[];
      json['bills'].forEach((v) {
        bills!.add(DBBillDetails.fromJson(v));
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
}

class DBLabInfo {
  int? id;
  String? labName;

  DBLabInfo({this.id, this.labName});

  DBLabInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lab_name'] = labName;
    return data;
  }

  LabInfo toDomain() {
    return LabInfo(
      id: id,
      labName: labName,
    );
  }

  static DBLabInfo fromDomain(LabInfo domain) {
    return DBLabInfo(
      id: domain.id,
      labName: domain.labName,
    );
  }
}

class DBBillDetails {
  int? id;
  int? totalCost;
  String? dateFrom; // Can be parsed to DateTime if needed
  String? dateTo; // Can be parsed to DateTime if needed
  String? createdAt; // Can be parsed to DateTime if needed

  DBBillDetails({
    this.id,
    this.totalCost,
    this.dateFrom,
    this.dateTo,
    this.createdAt,
  });

  DBBillDetails.fromJson(Map<String, dynamic> json) {
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

  BillDetails toDomain() {
    return BillDetails(
      id: id,
      totalCost: totalCost,
      dateFrom: dateFrom,
      dateTo: dateTo,
      createdAt: createdAt,
    );
  }

  static DBBillDetails fromDomain(BillDetails domain) {
    return DBBillDetails(
      id: domain.id,
      totalCost: domain.totalCost,
      dateFrom: domain.dateFrom,
      dateTo: domain.dateTo,
      createdAt: domain.createdAt,
    );
  }
}
