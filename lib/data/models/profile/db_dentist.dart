import '../../../domain/models/profile/dentist.dart';

class DBDentistProfileResponse {
  bool? status;
  int? successCode;
  DBDentistProfile? profile;
  String? successMessage;

  DBDentistProfileResponse(
      {this.status, this.successCode, this.profile, this.successMessage});

  DBDentistProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    profile = json['profile'] != null
        ? DBDentistProfile.fromJson(json['profile'])
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

class DBDentistProfile {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? phone; // Assuming phone can be an int based on the example
  String? address;
  String? province;
  String? emailVerifiedAt;
  int? emailIsVerified;
  String? verificationCode;
  String? imagePath;
  int? registerAccepted;
  String? registerDate;
  int? subscriptionIsValidNow;

  DBDentistProfile({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.province,
    this.emailVerifiedAt,
    this.emailIsVerified,
    this.verificationCode,
    this.imagePath,
    this.registerAccepted,
    this.registerDate,
    this.subscriptionIsValidNow,
  });

  DBDentistProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    province = json['province'];
    emailVerifiedAt = json['email_verified_at'];
    emailIsVerified = json['email_is_verified'];
    verificationCode = json['verification_code'];
    imagePath = json['image_path'];
    registerAccepted = json['register_accepted'];
    registerDate = json['register_date'];
    subscriptionIsValidNow = json['subscription_is_valid_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['province'] = province;
    data['email_verified_at'] = emailVerifiedAt;
    data['email_is_verified'] = emailIsVerified;
    data['verification_code'] = verificationCode;
    data['image_path'] = imagePath;
    data['register_accepted'] = registerAccepted;
    data['register_date'] = registerDate;
    data['subscription_is_valid_now'] = subscriptionIsValidNow;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  DentistProfile toDomain() {
    return DentistProfile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      address: address,
      province: province,
      emailVerifiedAt: emailVerifiedAt, // Convert String to DateTime
      emailIsVerified: emailIsVerified,
      verificationCode: verificationCode,
      imagePath: imagePath,
      registerAccepted: registerAccepted,
      registerDate: registerDate, // Convert String to DateTime
      subscriptionIsValidNow: subscriptionIsValidNow,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBDentistProfile fromDomain(DentistProfile domain) {
    return DBDentistProfile(
      id: domain.id,
      firstName: domain.firstName,
      lastName: domain.lastName,
      email: domain.email,
      phone: domain.phone,
      address: domain.address,
      province: domain.province,
      emailVerifiedAt: domain.emailVerifiedAt, // Convert DateTime to String
      emailIsVerified: domain.emailIsVerified,
      verificationCode: domain.verificationCode,
      imagePath: domain.imagePath,
      registerAccepted: domain.registerAccepted,
      registerDate: domain.registerDate, // Convert DateTime to String
      subscriptionIsValidNow: domain.subscriptionIsValidNow,
    );
  }
}
