import '../../../domain/models/secretary/secretaries.dart';

class DBSecretariesResponse {
  bool? status;
  int? successCode;
  List<DBSecretary>? secretaries;
  String? successMessage;

  DBSecretariesResponse({
    this.status,
    this.successCode,
    this.secretaries,
    this.successMessage,
  });

  factory DBSecretariesResponse.fromJson(Map<String, dynamic> json) {
    return DBSecretariesResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      secretaries: (json['secretaries'] as List<dynamic>?)
          ?.map((e) => DBSecretary.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (secretaries != null) {
      data['secretaries'] = secretaries!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBSecretary {
  int? id;
  String? fullName;
  String? phone;
  String? email;
  String? attendanceTime;
  String? address;

  DBSecretary({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.attendanceTime,
    this.address,
  });

  factory DBSecretary.fromJson(Map<String, dynamic> json) {
    return DBSecretary(
      id: json['id'] as int?,
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      attendanceTime: json['attendence_time'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['email'] = email;
    data['attendence_time'] = attendanceTime;
    data['address'] = address;
    return data;
  }

  Secretary toDomain() {
    return Secretary(
      id: id,
      fullName: fullName,
      address: address,
      attendanceTime: attendanceTime,
      email: email,
      phone: phone,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBSecretary fromDomain(Secretary domain) {
    return DBSecretary(
      id: domain.id,
      fullName: domain.fullName,
      phone: domain.phone,
      email: domain.email,
      attendanceTime: domain.attendanceTime,
      address: domain.address,
    );
  }
}
