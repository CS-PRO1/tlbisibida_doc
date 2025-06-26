class PatientTreatmentsResponse {
  bool? status;
  int? successCode;
  List<PatientTreatment>? patientTreatments;
  String? successMessage;

  PatientTreatmentsResponse({
    this.status,
    this.successCode,
    this.patientTreatments,
    this.successMessage,
  });

  factory PatientTreatmentsResponse.fromJson(Map<String, dynamic> json) {
    return PatientTreatmentsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      patientTreatments: (json['patient_treatments'] as List<dynamic>?)
          ?.map((e) => PatientTreatment.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (patientTreatments != null) {
      data['patient_treatments'] =
          patientTreatments!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class PatientTreatment {
  int? id;
  String? type;
  String? date; // Consider parsing to DateTime if you need a DateTime object

  PatientTreatment({
    this.id,
    this.type,
    this.date,
  });

  factory PatientTreatment.fromJson(Map<String, dynamic> json) {
    return PatientTreatment(
      id: json['id'] as int?,
      type: json['type'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['date'] = date;
    return data;
  }
}
