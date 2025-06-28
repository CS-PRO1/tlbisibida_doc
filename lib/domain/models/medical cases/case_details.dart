// medical_case_response.dart
// import 'dart:convert'; // For json.decode and json.encode if you're testing this standalone

class MedicalCaseResponse {
  bool? status;
  int? successCode;
  MedicalCase? medicalCase; // Note the direct object, not a list
  String? successMessage;

  MedicalCaseResponse({
    this.status,
    this.successCode,
    this.medicalCase,
    this.successMessage,
  });

  MedicalCaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    medicalCase = json['medical_case'] != null
        ? MedicalCase.fromJson(json['medical_case'])
        : null;
    successMessage = json['success_message'];
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
}

class MedicalCase {
  MedicalCaseDetails? medicalCaseDetails;
  List<PatientDetails>? patientDetails;
  List<MedicalCaseFile>? medicalCaseFiles;

  MedicalCase({
    this.medicalCaseDetails,
    this.patientDetails,
    this.medicalCaseFiles,
  });

  MedicalCase.fromJson(Map<String, dynamic> json) {
    medicalCaseDetails = json['medical_case_details'] != null
        ? MedicalCaseDetails.fromJson(json['medical_case_details'])
        : null;
    if (json['patient_details'] != null) {
      patientDetails = <PatientDetails>[];
      json['patient_details'].forEach((v) {
        patientDetails!.add(PatientDetails.fromJson(v));
      });
    }
    if (json['medical_case_files'] != null) {
      medicalCaseFiles = <MedicalCaseFile>[];
      json['medical_case_files'].forEach((v) {
        medicalCaseFiles!.add(MedicalCaseFile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicalCaseDetails != null) {
      data['medical_case_details'] = medicalCaseDetails!.toJson();
    }
    if (patientDetails != null) {
      data['patient_details'] = patientDetails!.map((v) => v.toJson()).toList();
    }
    if (medicalCaseFiles != null) {
      data['medical_case_files'] =
          medicalCaseFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicalCaseDetails {
  int? id;
  int? dentistId;
  int? labManagerId;
  int? patientId;
  String? age; // Note: "22" is a string in JSON, so mapping to String
  int? needTrial;
  int? repeat;
  String? shade;
  String? expectedDeliveryDate;
  String? notes;
  int? status;
  int? confirmDelivery;
  int? cost;
  String? teethCrown; // These can be null, so String?
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
  String? createdAt; // Can be null
  String? updatedAt; // Can be null

  MedicalCaseDetails({
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

  MedicalCaseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dentistId = json['dentist_id'];
    labManagerId = json['lab_manager_id'];
    patientId = json['patient_id'];
    age = json['age'];
    needTrial = json['need_trial'];
    repeat = json['repeat'];
    shade = json['shade'];
    expectedDeliveryDate = json['expected_delivery_date'];
    notes = json['notes'];
    status = json['status'];
    confirmDelivery = json['confirm_delivery'];
    cost = json['cost'];
    teethCrown = json['teeth_crown'];
    teethPontic = json['teeth_pontic'];
    teethImplant = json['teeth_implant'];
    teethVeneer = json['teeth_veneer'];
    teethInlay = json['teeth_inlay'];
    teethDenture = json['teeth_denture'];
    bridgesCrown = json['bridges_crown'];
    bridgesPontic = json['bridges_pontic'];
    bridgesImplant = json['bridges_implant'];
    bridgesVeneer = json['bridges_veneer'];
    bridgesInlay = json['bridges_inlay'];
    bridgesDenture = json['bridges_denture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
}

class PatientDetails {
  int? id;
  int? dentistId;
  String? fullName;
  String? address;
  String? phone; // Note: "0980000854" is a string in JSON
  String? birthday;
  int? currentBalance;
  int? isSmoker;
  String? gender;
  String? createdAt;
  String? updatedAt;

  PatientDetails({
    this.id,
    this.dentistId,
    this.fullName,
    this.address,
    this.phone,
    this.birthday,
    this.currentBalance,
    this.isSmoker,
    this.gender,
    this.createdAt,
    this.updatedAt,
  });

  PatientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dentistId = json['dentist_id'];
    fullName = json['full_name'];
    address = json['address'];
    phone = json['phone'];
    birthday = json['birthday'];
    currentBalance = json['current_balance'];
    isSmoker = json['is_smoker'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['full_name'] = fullName;
    data['address'] = address;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['current_balance'] = currentBalance;
    data['is_smoker'] = isSmoker;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MedicalCaseFile {
  int? id;
  int? medicalCaseId;
  String? name;
  int? isCaseImage;
  String? createdAt;
  String? updatedAt;

  MedicalCaseFile({
    this.id,
    this.medicalCaseId,
    this.name,
    this.isCaseImage,
    this.createdAt,
    this.updatedAt,
  });

  MedicalCaseFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicalCaseId = json['medical_case_id'];
    name = json['name'];
    isCaseImage = json['is_case_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
}
