class SecretariesResponse {
  bool? status;
  int? successCode;
  List<Secretary>? secretaries;
  String? successMessage;

  SecretariesResponse({
    this.status,
    this.successCode,
    this.secretaries,
    this.successMessage,
  });

  factory SecretariesResponse.fromJson(Map<String, dynamic> json) {
    return SecretariesResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      secretaries: (json['secretaries'] as List<dynamic>?)
          ?.map((e) => Secretary.fromJson(e as Map<String, dynamic>))
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

class Secretary {
  int? id;
  String? fullName;
  String? phone;
  String? email;
  String? attendanceTime;
  String? address;

  Secretary({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.attendanceTime,
    this.address,
  });

  factory Secretary.fromJson(Map<String, dynamic> json) {
    return Secretary(
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
}
