// lab_bills_response.dart

class DBLabBillsResponse {
  bool? status;
  int? successCode;
  LabBillsData? labBills; // Note: this is an object, not a list
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
        ? LabBillsData.fromJson(json['lab_bills'])
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

class LabBillsData {
  LabOverview? lab; // The nested lab object
  List<BillItem>? bills; // The list of bills

  LabBillsData({this.lab, this.bills});

  LabBillsData.fromJson(Map<String, dynamic> json) {
    lab = json['lab'] != null ? LabOverview.fromJson(json['lab']) : null;
    if (json['bills'] != null) {
      bills = <BillItem>[];
      json['bills'].forEach((v) {
        bills!.add(BillItem.fromJson(v));
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

class LabOverview {
  int? id;
  String? labName;

  LabOverview({this.id, this.labName});

  LabOverview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lab_name'] = labName;
    return data;
  }
}

class BillItem {
  int? id;
  int? totalCost;
  String? dateFrom;
  String? dateTo;
  String? createdAt;

  BillItem(
      {this.id, this.totalCost, this.dateFrom, this.dateTo, this.createdAt});

  BillItem.fromJson(Map<String, dynamic> json) {
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
}
