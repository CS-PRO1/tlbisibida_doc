// medical_case_response.dart
import 'package:tlbisibida_doc/domain/models/medical%20cases/case_details.dart';

class DBMedicalCaseResponse {
  bool? status;
  int? successCode;
  DBMedicalCase? medicalCase; // Note: this is an object, not a list
  String? successMessage;

  DBMedicalCaseResponse({
    this.status,
    this.successCode,
    this.medicalCase,
    this.successMessage,
  });

  factory DBMedicalCaseResponse.fromJson(Map<String, dynamic> json) {
    return DBMedicalCaseResponse(
      status: json['status'],
      successCode: json['success_code'],
      medicalCase: json['medical_case'] != null
          ? DBMedicalCase.fromJson(json['medical_case'])
          : null,
      successMessage: json['success_message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (medicalCase != null) {
      data['medical_case'] = medicalCase!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }

  // --- TO DOMAIN FUNCTION FOR THE RESPONSE ITSELF ---
  // This maps the overall response DTO to the top-level domain object.
  MedicalCaseResponse? toDomain() {
    if (medicalCase == null) return null;
    // The top-level response directly maps to the MedicalCaseResponse domain
    // by delegating the conversion to the nested DBMedicalCase.
    return medicalCase!.toDomain();
  }
}

class DBMedicalCase {
  DBMedicalCaseDetails? medicalCaseDetails;
  String? patientFullName;
  String? patientGender;
  String? dentistFirstName;
  String? dentistLastName;
  List<DBMedicalCaseFile>? medicalCaseFiles;

  DBMedicalCase({
    this.medicalCaseDetails,
    this.patientFullName,
    this.patientGender,
    this.dentistFirstName,
    this.dentistLastName,
    this.medicalCaseFiles,
  });

  factory DBMedicalCase.fromJson(Map<String, dynamic> json) {
    return DBMedicalCase(
      medicalCaseDetails: json['medical_case_details'] != null
          ? DBMedicalCaseDetails.fromJson(json['medical_case_details'])
          : null,
      patientFullName: json['patient_full_name'],
      patientGender: json['patient_gender'],
      dentistFirstName: json['dentist_first_name'],
      dentistLastName: json['dentist_last_name'],
      medicalCaseFiles: (json['medical_case_files'] as List?)
          ?.map((e) => DBMedicalCaseFile.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicalCaseDetails != null) {
      data['medical_case_details'] = medicalCaseDetails!.toJson();
    }
    data['patient_full_name'] = patientFullName;
    data['patient_gender'] = patientGender;
    data['dentist_first_name'] = dentistFirstName;
    data['dentist_last_name'] = dentistLastName;
    if (medicalCaseFiles != null) {
      data['medical_case_files'] =
          medicalCaseFiles!.map((e) => e.toJson()).toList();
    }
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  // This maps the DBMedicalCase DTO to the MedicalCaseResponse domain model.
  MedicalCaseResponse toDomain() {
    final String dentistFullName =
        '${dentistFirstName ?? ''} ${dentistLastName ?? ''}'.trim();
    return MedicalCaseResponse(
      id: medicalCaseDetails?.id ?? 0,
      patientId: medicalCaseDetails?.patientId ?? 0,
      patientFullName: patientFullName ?? '',
      patientGender: patientGender ?? '',
      dentistFullName: dentistFullName,
      age: medicalCaseDetails?.age ?? '',
      expectedDeliveryDate: medicalCaseDetails?.expectedDeliveryDate ?? '',
      shade: medicalCaseDetails?.shade,
      notes: medicalCaseDetails?.notes,
      status: medicalCaseDetails?.status ?? 0,
      cost: medicalCaseDetails?.cost ?? 0,
      // Split teethCrown only if it's not null, otherwise provide an empty list
      teethCrowns: medicalCaseDetails?.teethCrown?.split(',') ?? [],
      files: medicalCaseFiles?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBMedicalCase fromDomain(MedicalCaseResponse domain) {
    // Note: Reconstructing dentistFirstName and dentistLastName from a single dentistFullName
    // in the domain model can be ambiguous if the format isn't strictly "FirstName LastName".
    // For simplicity, we'll assign the whole name to dentistFirstName.
    final List<String> dentistNameParts = domain.dentistFullName.split(' ');
    final String? firstName =
        dentistNameParts.isNotEmpty ? dentistNameParts.first : null;
    final String? lastName = dentistNameParts.length > 1
        ? dentistNameParts.sublist(1).join(' ')
        : null;

    return DBMedicalCase(
      medicalCaseDetails: DBMedicalCaseDetails.fromDomain(domain),
      patientFullName: domain.patientFullName,
      patientGender: domain.patientGender,
      dentistFirstName: firstName,
      dentistLastName: lastName,
      medicalCaseFiles:
          domain.files.map((e) => DBMedicalCaseFile.fromDomain(e)).toList(),
    );
  }
}

class DBMedicalCaseDetails {
  int? id;
  int? dentistId;
  int? labManagerId;
  int? patientId;
  String? age;
  int? needTrial; // Mapped to int for 0/1 boolean
  int? repeat; // Mapped to int for 0/1 boolean
  String? shade;
  String? expectedDeliveryDate;
  String? notes;
  int? status;
  int? confirmDelivery; // Mapped to int for 0/1 boolean
  int? cost;
  String? teethCrown; // Comma-separated string
  String? teethPontic;
  String? teethImplant;
  String? teethVeneer;
  String? teethInlay;
  String? teethDenture;
  String? bridgesCrown;
  String? bridgesPontic;
  String? bridgesImplant;
  String? bridgesVeneer;
  String? bridgesInlay;
  String? bridgesDenture;
  String? createdAt;
  String? updatedAt;

  DBMedicalCaseDetails({
    this.id,
    this.dentistId,
    this.labManagerId,
    this.patientId,
    this.age,
    this.needTrial,
    this.repeat,
    this.shade,
    this.expectedDeliveryDate,
    this.notes,
    this.status,
    this.confirmDelivery,
    this.cost,
    this.teethCrown,
    this.teethPontic,
    this.teethImplant,
    this.teethVeneer,
    this.teethInlay,
    this.teethDenture,
    this.bridgesCrown,
    this.bridgesPontic,
    this.bridgesImplant,
    this.bridgesVeneer,
    this.bridgesInlay,
    this.bridgesDenture,
    this.createdAt,
    this.updatedAt,
  });

  factory DBMedicalCaseDetails.fromJson(Map<String, dynamic> json) {
    return DBMedicalCaseDetails(
      id: json['id'],
      dentistId: json['dentist_id'],
      labManagerId: json['lab_manager_id'],
      patientId: json['patient_id'],
      age: json['age'],
      needTrial: json['need_trial'],
      repeat: json['repeat'],
      shade: json['shade'],
      expectedDeliveryDate: json['expected_delivery_date'],
      notes: json['notes'],
      status: json['status'],
      confirmDelivery: json['confirm_delivery'],
      cost: json['cost'],
      teethCrown: json['teeth_crown'],
      teethPontic: json['teeth_pontic'],
      teethImplant: json['teeth_implant'],
      teethVeneer: json['teeth_veneer'],
      teethInlay: json['teeth_inlay'],
      teethDenture: json['teeth_denture'],
      bridgesCrown: json['bridges_crown'],
      bridgesPontic: json['bridges_pontic'],
      bridgesImplant: json['bridges_implant'],
      bridgesVeneer: json['bridges_veneer'],
      bridgesInlay: json['bridges_inlay'],
      bridgesDenture: json['bridges_denture'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    data['patient_id'] = patientId;
    data['age'] = age;
    data['need_trial'] = needTrial;
    data['repeat'] = repeat;
    data['shade'] = shade;
    data['expected_delivery_date'] = expectedDeliveryDate;
    data['notes'] = notes;
    data['status'] = status;
    data['confirm_delivery'] = confirmDelivery;
    data['cost'] = cost;
    data['teeth_crown'] = teethCrown;
    data['teeth_pontic'] = teethPontic;
    data['teeth_implant'] = teethImplant;
    data['teeth_veneer'] = teethVeneer;
    data['teeth_inlay'] = teethInlay;
    data['teeth_denture'] = teethDenture;
    data['bridges_crown'] = bridgesCrown;
    data['bridges_pontic'] = bridgesPontic;
    data['bridges_implant'] = bridgesImplant;
    data['bridges_veneer'] = bridgesVeneer;
    data['bridges_inlay'] = bridgesInlay;
    data['bridges_denture'] = bridgesDenture;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  // This DTO directly contributes to the MedicalCaseResponse domain model,
  // but it doesn't map to a standalone domain object of its own in the provided
  // domain model structure. Its fields are picked up by DBMedicalCase.toDomain.
  // Therefore, a direct 'toDomain' function for DBMedicalCaseDetails returning
  // a specific domain object is not strictly necessary based on your current
  // MedicalCaseResponse structure.

  // --- FROM DOMAIN FUNCTION ---
  static DBMedicalCaseDetails fromDomain(MedicalCaseResponse domain) {
    return DBMedicalCaseDetails(
      id: domain.id,
      patientId: domain.patientId,
      age: domain.age,
      expectedDeliveryDate: domain.expectedDeliveryDate,
      shade: domain.shade,
      notes: domain.notes,
      status: domain.status,
      cost: domain.cost,
      teethCrown: domain.teethCrowns.join(','),
      // Other fields like dentistId, labManagerId, needTrial, repeat, confirmDelivery,
      // and other teeth types are not present in the MedicalCaseResponse domain model.
      // If these need to be recreated for a 'fromDomain' scenario, they would either
      // need to be added to the domain model or be passed as parameters here.
    );
  }
}

class DBMedicalCaseFile {
  int? id;
  int? medicalCaseId;
  String? name;
  int? isCaseImage; // Mapped to int for 0/1 boolean
  String? createdAt;
  String? updatedAt;

  DBMedicalCaseFile({
    this.id,
    this.medicalCaseId,
    this.name,
    this.isCaseImage,
    this.createdAt,
    this.updatedAt,
  });

  factory DBMedicalCaseFile.fromJson(Map<String, dynamic> json) {
    return DBMedicalCaseFile(
      id: json['id'],
      medicalCaseId: json['medical_case_id'],
      name: json['name'],
      isCaseImage: json['is_case_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medical_case_id'] = medicalCaseId;
    data['name'] = name;
    data['is_case_image'] = isCaseImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  // This maps the DBMedicalCaseFile DTO to its corresponding domain model.
  MedicalCaseFileDomain toDomain() {
    return MedicalCaseFileDomain(
      id: id ?? 0,
      name: name ?? '',
      isCaseImage: isCaseImage == 1, // Convert int (0/1) to boolean
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBMedicalCaseFile fromDomain(MedicalCaseFileDomain domain) {
    return DBMedicalCaseFile(
      id: domain.id,
      name: domain.name,
      isCaseImage: domain.isCaseImage ? 1 : 0, // Convert boolean to int (1/0)
    );
  }
}
