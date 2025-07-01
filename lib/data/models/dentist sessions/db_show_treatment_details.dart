import '../../../domain/models/dentist sessions/show_treatment_details.dart';

class DBTreatmentDetailsResponse {
  bool? status;
  int? successCode;
  DBTreatmentDetails? treatmentDetails;
  String? successMessage;

  DBTreatmentDetailsResponse({
    this.status,
    this.successCode,
    this.treatmentDetails,
    this.successMessage,
  });

  factory DBTreatmentDetailsResponse.fromJson(Map<String, dynamic> json) {
    return DBTreatmentDetailsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      treatmentDetails: json['treatment_details'] != null
          ? DBTreatmentDetails.fromJson(
              json['treatment_details'] as Map<String, dynamic>)
          : null,
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (treatmentDetails != null) {
      data['treatment_details'] = treatmentDetails!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBTreatmentDetails {
  int? id;
  int? patientId;
  int? dentistId;
  int? medicalCaseId; // Can be null
  int? cost;
  String? title;
  String? type;
  String? details;
  String? date; // Consider parsing to DateTime if needed
  int? isPaid; // Consider using bool?
  String? createdAt; // Consider parsing to DateTime
  String? updatedAt; // Consider parsing to DateTime
  List<DBTreatmentImage>? images;

  DBTreatmentDetails({
    this.id,
    this.patientId,
    this.dentistId,
    this.medicalCaseId,
    this.cost,
    this.title,
    this.type,
    this.details,
    this.date,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  factory DBTreatmentDetails.fromJson(Map<String, dynamic> json) {
    return DBTreatmentDetails(
      id: json['id'] as int?,
      patientId: json['patient_id'] as int?,
      dentistId: json['dentist_id'] as int?,
      medicalCaseId: json['medical_case_id'] as int?,
      cost: json['cost'] as int?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      details: json['details'] as String?,
      date: json['date'] as String?,
      isPaid: json['is_paid'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => DBTreatmentImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['dentist_id'] = dentistId;
    data['medical_case_id'] = medicalCaseId;
    data['cost'] = cost;
    data['title'] = title;
    data['type'] = type;
    data['details'] = details;
    data['date'] = date;
    data['is_paid'] = isPaid;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((e) => e.toJson()).toList();
    }
    return data;
  } // --- TO DOMAIN FUNCTION ---

  TreatmentDetails toDomain() {
    return TreatmentDetails(
      id: id,
      patientId: patientId,
      dentistId: dentistId,
      medicalCaseId: medicalCaseId,
      cost: cost,
      title: title,
      type: type,
      details: details,
      date: date,
      isPaid: isPaid == 1, // Convert int (0 or 1) to bool
      createdAt: createdAt,
      updatedAt: updatedAt,
      images: images?.map((e) => e.toDomain()).toList(), // Map list items
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBTreatmentDetails fromDomain(TreatmentDetails domain) {
    return DBTreatmentDetails(
      id: domain.id,
      patientId: domain.patientId,
      dentistId: domain.dentistId,
      medicalCaseId: domain.medicalCaseId,
      cost: domain.cost,
      title: domain.title,
      type: domain.type,
      details: domain.details,
      date: domain.date,
      isPaid: domain.isPaid == true ? 1 : 0, // Convert bool to int (1 or 0)
      createdAt: domain.createdAt,
      updatedAt: domain.updatedAt,
      images: domain.images
          ?.map((e) => DBTreatmentImage.fromDomain(e))
          .toList(), // Map list items
    );
  }
}

class DBTreatmentImage {
  int? id;
  int? treatmentId;
  String? name;
  int? isDiagram; // Consider using bool?

  DBTreatmentImage({
    this.id,
    this.treatmentId,
    this.name,
    this.isDiagram,
  });

  factory DBTreatmentImage.fromJson(Map<String, dynamic> json) {
    return DBTreatmentImage(
      id: json['id'] as int?,
      treatmentId: json['treatment_id'] as int?,
      name: json['name'] as String?,
      isDiagram: json['is_diagram'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['treatment_id'] = treatmentId;
    data['name'] = name;
    data['is_diagram'] = isDiagram;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  TreatmentImage toDomain() {
    return TreatmentImage(
      id: id,
      treatmentId: treatmentId,
      name: name,
      isDiagram: isDiagram == 1, // Convert int (0 or 1) to bool
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBTreatmentImage fromDomain(TreatmentImage domain) {
    return DBTreatmentImage(
      id: domain.id,
      treatmentId: domain.treatmentId,
      name: domain.name,
      isDiagram:
          domain.isDiagram == true ? 1 : 0, // Convert bool to int (1 or 0)
    );
  }
}
