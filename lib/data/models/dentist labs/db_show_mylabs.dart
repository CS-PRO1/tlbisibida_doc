import '../../../domain/models/dentist labs/show_mylabs.dart';

class DBLabsJoinedResponse {
  bool? status;
  int? successCode;
  List<DBJoinedLab>?
      labsIamJoind; // Corrected to match JSON key "labs iam joind"
  String? successMessage;

  DBLabsJoinedResponse({
    this.status,
    this.successCode,
    this.labsIamJoind,
    this.successMessage,
  });

  factory DBLabsJoinedResponse.fromJson(Map<String, dynamic> json) {
    return DBLabsJoinedResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      labsIamJoind: (json['labs iam joind'] as List<dynamic>?)
          ?.map((e) => DBJoinedLab.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labsIamJoind != null) {
      data['labs iam joind'] = labsIamJoind!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBJoinedLab {
  String? labName;
  String? labLogo;
  DBPivot? pivot;

  DBJoinedLab({
    this.labName,
    this.labLogo,
    this.pivot,
  });

  factory DBJoinedLab.fromJson(Map<String, dynamic> json) {
    return DBJoinedLab(
      labName: json['lab_name'] as String?,
      labLogo: json['lab_logo'] as String?,
      pivot: json['pivot'] != null
          ? DBPivot.fromJson(json['pivot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_name'] = labName;
    data['lab_logo'] = labLogo;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  } // >>>>>>>>>>>>>> TO DOMAIN FUNCTION <<<<<<<<<<<<<<

  JoinedLab toDomain() {
    return JoinedLab(
      labName: labName,
      labLogo: labLogo,
      pivot: pivot?.toDomain(), // Recursively call toDomain
    );
  }

  // >>>>>>>>>>>>>> FROM DOMAIN FUNCTION <<<<<<<<<<<<<<
  static DBJoinedLab fromDomain(JoinedLab domain) {
    return DBJoinedLab(
      labName: domain.labName,
      labLogo: domain.labLogo,
      pivot: domain.pivot != null
          ? DBPivot.fromDomain(domain.pivot!)
          : null, // Recursively call fromDomain
    );
  }
}

class DBPivot {
  int? dentistId;
  int? labManagerId;

  DBPivot({
    this.dentistId,
    this.labManagerId,
  });

  factory DBPivot.fromJson(Map<String, dynamic> json) {
    return DBPivot(
      dentistId: json['dentist_id'] as int?,
      labManagerId: json['lab_manager_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    return data;
  } // >>>>>>>>>>>>>> TO DOMAIN FUNCTION <<<<<<<<<<<<<<

  Pivot toDomain() {
    return Pivot(
      dentistId: dentistId,
      labManagerId: labManagerId,
    );
  }

  // >>>>>>>>>>>>>> FROM DOMAIN FUNCTION <<<<<<<<<<<<<<
  static DBPivot fromDomain(Pivot domain) {
    return DBPivot(
      dentistId: domain.dentistId,
      labManagerId: domain.labManagerId,
    );
  }
}
