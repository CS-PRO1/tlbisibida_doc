import '../../../domain/models/dentist sessions/show_patient_treatments.dart';

class DBPatientTreatmentsResponse {
  bool? status;
  int? successCode;
  List<DBPatientTreatment>? patientTreatments;
  String? successMessage;

  DBPatientTreatmentsResponse({
    this.status,
    this.successCode,
    this.patientTreatments,
    this.successMessage,
  });

  factory DBPatientTreatmentsResponse.fromJson(Map<String, dynamic> json) {
    return DBPatientTreatmentsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      patientTreatments: (json['patient_treatments'] as List<dynamic>?)
          ?.map((e) => DBPatientTreatment.fromJson(e as Map<String, dynamic>))
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

class DBPatientTreatment {
  int? id;
  String? type;
  String? date; // Consider parsing to DateTime if you need a DateTime object

  DBPatientTreatment({
    this.id,
    this.type,
    this.date,
  });

  factory DBPatientTreatment.fromJson(Map<String, dynamic> json) {
    return DBPatientTreatment(
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

  // >>>>>>>>>>>>>> TO DOMAIN FUNCTION <<<<<<<<<<<<<<
  PatientTreatment toDomain() {
    return PatientTreatment(
      id: id,
      type: type,
      date: date,
    );
  }

  // >>>>>>>>>>>>>> FROM DOMAIN FUNCTION <<<<<<<<<<<<<<
  static DBPatientTreatment fromDomain(PatientTreatment domain) {
    return DBPatientTreatment(
      id: domain.id,
      type: domain.type,
      date: domain.date,
    );
  }
}
