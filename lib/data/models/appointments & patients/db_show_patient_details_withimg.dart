import 'package:tlbisibida_doc/domain/models/appoinments%20&%20patients/show_patient_details_withimg.dart';

class DBPatientDetailsResponse {
  bool? status;
  int? successCode;
  DBPatientDetails? patientDetails;
  String? successMessage;

  DBPatientDetailsResponse({
    this.status,
    this.successCode,
    this.patientDetails,
    this.successMessage,
  });

  DBPatientDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    patientDetails = json['patient_details'] != null
        ? DBPatientDetails.fromJson(json['patient_details'])
        : null;
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (patientDetails != null) {
      data['patient_details'] = patientDetails!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBPatientDetails {
  int? id;
  int? dentistId;
  String? fullName;
  String? address;
  String? phone;
  String? birthday; // Consider parsing to DateTime
  int? currentBalance;
  int? isSmoker; // Consider using bool?
  String? gender;
  String? medicineName; // Can be null
  String? illnessName; // Can be null
  String? createdAt; // Consider parsing to DateTime
  String? updatedAt; // Consider parsing to DateTime
  List<DBPatientImage>? images;

  DBPatientDetails({
    this.id,
    this.dentistId,
    this.fullName,
    this.address,
    this.phone,
    this.birthday,
    this.currentBalance,
    this.isSmoker,
    this.gender,
    this.medicineName,
    this.illnessName,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  DBPatientDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dentistId = json['dentist_id'];
    fullName = json['full_name'];
    address = json['address'];
    phone = json['phone'];
    birthday = json['birthday'];
    currentBalance = json['current_balance'];
    isSmoker = json['is_smoker'];
    gender = json['gender'];
    medicineName = json['medicine_name'];
    illnessName = json['illness_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <DBPatientImage>[];
      json['images'].forEach((v) {
        images!.add(DBPatientImage.fromJson(v));
      });
    }
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
    data['medicine_name'] = medicineName;
    data['illness_name'] = illnessName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  PatientDetails todomain() {
    return PatientDetails(
      address: address,
      birthday: birthday,
      createdAt: createdAt,
      currentBalance: currentBalance,
      dentistId: dentistId,
      fullName: fullName,
      gender: gender,
      id: id,
      isSmoker: isSmoker == 1 ? true : false,
      phone: phone,
      updatedAt: updatedAt,
    );
  }

  static DBPatientDetails fromjson(PatientDetails pd) {
    return DBPatientDetails()
      ..address = pd.address
      ..birthday = pd.birthday
      ..createdAt = pd.createdAt
      ..currentBalance = pd.currentBalance
      ..dentistId = pd.dentistId
      ..fullName = pd.fullName
      ..gender = pd.gender
      ..id = pd.id
      ..isSmoker = pd.isSmoker == true ? 1 : 0
      ..phone = pd.phone
      ..updatedAt = pd.updatedAt;
  }
}

class DBPatientImage {
  int? id;
  int? patientId;
  String? name;

  DBPatientImage({
    this.id,
    this.patientId,
    this.name,
  });

  DBPatientImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['name'] = name;
    return data;
  }

  PatientImage todomain() {
    return PatientImage(id: id, name: name, patientId: patientId);
  }

  static DBPatientImage fromdomain(PatientImage pi) {
    return DBPatientImage()
      ..id = pi.id
      ..name = pi.name
      ..patientId = pi.patientId;
  }
}
