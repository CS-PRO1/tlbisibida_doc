// class PatientDetailsResponse {
//   bool? status;
//   int? successCode;
//   PatientDetails? patientDetails;
//   String? successMessage;

//   PatientDetailsResponse({
//     this.status,
//     this.successCode,
//     this.patientDetails,
//     this.successMessage,
//   });

//   PatientDetailsResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     successCode = json['success_code'];
//     patientDetails = json['patient_details'] != null
//         ? PatientDetails.fromJson(json['patient_details'])
//         : null;
//     successMessage = json['success_message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (patientDetails != null) {
//       data['patient_details'] = patientDetails!.toJson();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class PatientDetails {
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
  List<PatientImage>? images;

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
    this.medicineName,
    this.illnessName,
    this.createdAt,
    this.updatedAt,
    this.images,
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
    medicineName = json['medicine_name'];
    illnessName = json['illness_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <PatientImage>[];
      json['images'].forEach((v) {
        images!.add(PatientImage.fromJson(v));
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
}

class PatientImage {
  int? id;
  int? patientId;
  String? name;

  PatientImage({
    this.id,
    this.patientId,
    this.name,
  });

  PatientImage.fromJson(Map<String, dynamic> json) {
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
}
