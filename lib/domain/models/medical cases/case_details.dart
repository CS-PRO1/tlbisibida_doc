class MedicalCaseDetailsResponse {
  final bool? status;
  final int? successCode;
  final MedicalCase? medicalCase;
  final String? successMessage;

  MedicalCaseDetailsResponse({
    this.status,
    this.successCode,
    this.medicalCase,
    this.successMessage,
  });
}

class MedicalCase {
  final MedicalCaseDetails? medicalCaseDetails;
  final String? patientFullName;
  final String? patientGender;
  final String? dentistFirstName;
  final String? dentistLastName;
  final List<MedicalCaseFile> medicalCaseFiles;

  MedicalCase({
    this.medicalCaseDetails,
    this.patientFullName,
    this.patientGender,
    this.dentistFirstName,
    this.dentistLastName,
    required this.medicalCaseFiles,
  });
}

class MedicalCaseDetails {
  final int? id;
  final int? dentistId;
  final int? labManagerId;
  final int? patientId;
  final String? age;
  final int? needTrial;
  final int? repeat;
  final String? shade;
  final String? expectedDeliveryDate;
  final String? notes;
  final int? status;
  final int? confirmDelivery;
  final int? cost;
  final String? teethCrown;
  final String? teethPontic;
  final String? teethImplant;
  final String? teethVeneer;
  final String? teethInlay;
  final String? teethDenture;
  final String? bridgesCrown;
  final String? bridgesPontic;
  final String? bridgesImplant;
  final String? bridgesVeneer;
  final String? bridgesInlay;
  final String? bridgesDenture;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
}

class MedicalCaseFile {
  final int? id;
  final int? medicalCaseId;
  final String? name;
  final int? isCaseImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MedicalCaseFile({
    this.id,
    this.medicalCaseId,
    this.name,
    this.isCaseImage,
    this.createdAt,
    this.updatedAt,
  });
}
