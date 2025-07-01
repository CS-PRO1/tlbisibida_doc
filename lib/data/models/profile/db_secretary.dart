import '../../../domain/models/profile/secretary.dart';

class DBSecProfileResponse {
  bool? status;
  int? successCode;
  DBUserProfile?
      profile; // Renamed to UserProfile to avoid conflict if 'Profile' is a common Flutter widget name
  String? successMessage;

  DBSecProfileResponse(
      {this.status, this.successCode, this.profile, this.successMessage});

  DBSecProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    profile = json['profile'] != null
        ? DBUserProfile.fromJson(json['profile'])
        : null;
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBUserProfile {
  int? id;
  int? dentistId;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? emailVerifiedAt;
  int? emailIsVerified;
  int? isStaged;
  dynamic verificationCode; // Can be null, so dynamic or String?
  String? phone;
  String? attendenceTime;

  DBUserProfile(
      {this.id,
      this.dentistId,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.emailVerifiedAt,
      this.emailIsVerified,
      this.isStaged,
      this.verificationCode,
      this.phone,
      this.attendenceTime});

  DBUserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dentistId = json['dentist_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    emailIsVerified = json['email_is_verified'];
    isStaged = json['is_staged'];
    verificationCode = json['verification_code'];
    phone = json['phone'];
    attendenceTime = json['attendence_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['address'] = address;
    data['email_verified_at'] = emailVerifiedAt;
    data['email_is_verified'] = emailIsVerified;
    data['is_staged'] = isStaged;
    data['verification_code'] = verificationCode;
    data['phone'] = phone;
    data['attendence_time'] = attendenceTime;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  UserProfile toDomain() {
    return UserProfile(
      id: id,
      dentistId: dentistId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      address: address,
      emailVerifiedAt: emailVerifiedAt, // Convert String to DateTime
      emailIsVerified: emailIsVerified,
      isStaged: isStaged,
      verificationCode: verificationCode
          ?.toString(), // Convert dynamic to String for domain model
      phone: phone,
      attendenceTime: attendenceTime, // Convert String to DateTime
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBUserProfile fromDomain(UserProfile domain) {
    return DBUserProfile(
      id: domain.id,
      dentistId: domain.dentistId,
      firstName: domain.firstName,
      lastName: domain.lastName,
      email: domain.email,
      address: domain.address,
      emailVerifiedAt: domain.emailVerifiedAt, // Convert DateTime to String
      emailIsVerified: domain.emailIsVerified,
      isStaged: domain.isStaged,
      verificationCode:
          domain.verificationCode, // No special conversion needed here
      phone: domain.phone,
      attendenceTime: domain.attendenceTime!
          .substring(11, 16), // Convert DateTime back to HH:mm string
    );
  }
}
