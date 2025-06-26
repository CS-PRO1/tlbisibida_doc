// medical_cases_list_response.dart

class MedicalCasesListResponse {
  bool? status;
  int? successCode;
  List<MedicalCaseItem>? medicalCases;
  String? successMessage;

  MedicalCasesListResponse({
    this.status,
    this.successCode,
    this.medicalCases,
    this.successMessage,
  });

  MedicalCasesListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['medical_cases'] != null) {
      medicalCases = <MedicalCaseItem>[];
      json['medical_cases'].forEach((v) {
        medicalCases!.add(MedicalCaseItem.fromJson(v));
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

class MedicalCaseItem {
  int? id;
  int? patientId;
  String? expectedDeliveryDate;
  String? createdAt;
  PatientSummary? patient; // Nested patient object

  MedicalCaseItem({
    this.id,
    this.patientId,
    this.expectedDeliveryDate,
    this.createdAt,
    this.patient,
  });

  MedicalCaseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    expectedDeliveryDate = json['expected_delivery_date'];
    createdAt = json['created_at'];
    patient = json['patient'] != null
        ? PatientSummary.fromJson(json['patient'])
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
  }
}

class PatientSummary {
  int? id;
  String? fullName;

  PatientSummary({this.id, this.fullName});

  PatientSummary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    return data;
  }
}
