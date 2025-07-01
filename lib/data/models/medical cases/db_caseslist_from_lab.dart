// medical_cases_list_response.dart

import '../../../domain/models/medical cases/caselist_from_lab.dart';

class DBMedicalCasesListResponse {
  bool? status;
  int? successCode;
  List<DBMedicalCaseItem>? medicalCases;
  String? successMessage;

  DBMedicalCasesListResponse({
    this.status,
    this.successCode,
    this.medicalCases,
    this.successMessage,
  });

  DBMedicalCasesListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['medical_cases'] != null) {
      medicalCases = <DBMedicalCaseItem>[];
      json['medical_cases'].forEach((v) {
        medicalCases!.add(DBMedicalCaseItem.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (medicalCases != null) {
      data['medical_cases'] = medicalCases!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBMedicalCaseItem {
  int? id;
  int? patientId;
  String? expectedDeliveryDate;
  String? createdAt;
  DBPatientSummary? patient; // Nested patient object

  DBMedicalCaseItem({
    this.id,
    this.patientId,
    this.expectedDeliveryDate,
    this.createdAt,
    this.patient,
  });

  DBMedicalCaseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    expectedDeliveryDate = json['expected_delivery_date'];
    createdAt = json['created_at'];
    patient = json['patient'] != null
        ? DBPatientSummary.fromJson(json['patient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['expected_delivery_date'] = expectedDeliveryDate;
    data['created_at'] = createdAt;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    return data;
  } // --- TO DOMAIN FUNCTION ---

  MedicalCaseItem toDomain() {
    return MedicalCaseItem(
      id: id,
      patientId: patientId,
      expectedDeliveryDate: expectedDeliveryDate, // Convert String to DateTime
      createdAt: createdAt, // Convert String to DateTime
      patient: patient?.toDomain(),
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBMedicalCaseItem fromDomain(MedicalCaseItem domain) {
    return DBMedicalCaseItem(
      id: domain.id,
      patientId: domain.patientId,
      expectedDeliveryDate:
          domain.expectedDeliveryDate, // Convert DateTime to String
      createdAt: domain.createdAt, // Convert DateTime to String
      patient: domain.patient != null
          ? DBPatientSummary.fromDomain(domain.patient!)
          : null,
    );
  }
}

class DBPatientSummary {
  int? id;
  String? fullName;

  DBPatientSummary({this.id, this.fullName});

  DBPatientSummary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  // Since DBPatientSummary and PatientSummary are identical, the mapping is direct.
  PatientSummary toDomain() {
    return PatientSummary(
      id: id,
      fullName: fullName,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBPatientSummary and PatientSummary are identical, the mapping is direct.
  static DBPatientSummary fromDomain(PatientSummary domain) {
    return DBPatientSummary(
      id: domain.id,
      fullName: domain.fullName,
    );
  }
}
