class LabsJoinedResponse {
  bool? status;
  int? successCode;
  List<JoinedLab>? labsIamJoind; // Corrected to match JSON key "labs iam joind"
  String? successMessage;

  LabsJoinedResponse({
    this.status,
    this.successCode,
    this.labsIamJoind,
    this.successMessage,
  });

  factory LabsJoinedResponse.fromJson(Map<String, dynamic> json) {
    return LabsJoinedResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      labsIamJoind: (json['labs iam joind'] as List<dynamic>?)
          ?.map((e) => JoinedLab.fromJson(e as Map<String, dynamic>))
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

class JoinedLab {
  String? labName;
  String? labLogo;
  Pivot? pivot;

  JoinedLab({
    this.labName,
    this.labLogo,
    this.pivot,
  });

  factory JoinedLab.fromJson(Map<String, dynamic> json) {
    return JoinedLab(
      labName: json['lab_name'] as String?,
      labLogo: json['lab_logo'] as String?,
      pivot: json['pivot'] != null
          ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>)
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
  }
}

class Pivot {
  int? dentistId;
  int? labManagerId;

  Pivot({
    this.dentistId,
    this.labManagerId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      dentistId: json['dentist_id'] as int?,
      labManagerId: json['lab_manager_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    return data;
  }
}
