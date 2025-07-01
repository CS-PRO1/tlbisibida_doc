// labs_response.dart

import '../../../domain/models/medical cases/show_labs-send case to lab.dart';

class DBLabsResponse {
  bool? status;
  int? successCode;
  List<DBLabNameItem>? labs;
  String? successMessage;

  DBLabsResponse({
    this.status,
    this.successCode,
    this.labs,
    this.successMessage,
  });

  DBLabsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['labs'] != null) {
      labs = <DBLabNameItem>[];
      json['labs'].forEach((v) {
        labs!.add(DBLabNameItem.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labs != null) {
      data['labs'] = labs!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBLabNameItem {
  String? labName;

  DBLabNameItem({this.labName});

  DBLabNameItem.fromJson(Map<String, dynamic> json) {
    labName = json['lab_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_name'] = labName;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  // Since DBLabNameItem and LabNameItem are identical, the mapping is direct.
  LabNameItem toDomain() {
    return LabNameItem(
      labName: labName,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBLabNameItem and LabNameItem are identical, the mapping is direct.
  static DBLabNameItem fromDomain(LabNameItem domain) {
    return DBLabNameItem(
      labName: domain.labName,
    );
  }
}
