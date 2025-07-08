import 'package:tlbisibida_doc/domain/models/profile/dentist.dart';

class DBProfileResponse {
  bool? status;
  int? successCode;
  DBProfile? profile;
  String? successMessage;

  DBProfileResponse({
    this.status,
    this.successCode,
    this.profile,
    this.successMessage,
  });

  DBProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    profile =
        json['profile'] != null ? DBProfile.fromJson(json['profile']) : null;
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

  ProfileResponse toDomain() {
    return ProfileResponse(
      status: status,
      successCode: successCode,
      profile: profile?.toDomain(),
      successMessage: successMessage,
    );
  }
}

class DBProfile {
  DBProfileDetails? profileDetails;
  DBLastSubscription? lastSubscription;

  DBProfile({
    this.profileDetails,
    this.lastSubscription,
  });

  DBProfile.fromJson(Map<String, dynamic> json) {
    profileDetails = json['user'] != null ? DBProfileDetails.fromJson(json['user']) : null;
    lastSubscription = json['last_subscription'] != null
        ? DBLastSubscription.fromJson(json['last_subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profileDetails != null) {
      data['user'] = profileDetails!.toJson();
    }
    if (lastSubscription != null) {
      data['last_subscription'] = lastSubscription!.toJson();
    }
    return data;
  }

  Profile toDomain() {
    return Profile(
      profileDetails: profileDetails?.toDomain(),
      lastSubscription: lastSubscription?.toDomain(),
    );
  }
}

class DBProfileDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? registerSubscriptionDuration;
  int? phone;
  String? address;
  String? emailVerifiedAt;
  int? emailIsVerified;
  String? verificationCode;
  String? imagePath;
  String? registerAccepted;
  String? registerDate;
  String? subscriptionIsValidNow;
  String? createdAt;
  String? updatedAt;

  DBProfileDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.registerSubscriptionDuration,
    this.phone,
    this.address,
    this.emailVerifiedAt,
    this.emailIsVerified,
    this.verificationCode,
    this.imagePath,
    this.registerAccepted,
    this.registerDate,
    this.subscriptionIsValidNow,
    this.createdAt,
    this.updatedAt,
  });

  DBProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    registerSubscriptionDuration = json['register_subscription_duration'];
    phone = json['phone'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    emailIsVerified = json['email_is_verified'];
    verificationCode = json['verification_code'];
    imagePath = json['image_path'];
    registerAccepted = json['register_accepted'];
    registerDate = json['register_date'];
    subscriptionIsValidNow = json['subscription_is_valid_now'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['register_subscription_duration'] = registerSubscriptionDuration;
    data['phone'] = phone;
    data['address'] = address;
    data['email_verified_at'] = emailVerifiedAt;
    data['email_is_verified'] = emailIsVerified;
    data['verification_code'] = verificationCode;
    data['image_path'] = imagePath;
    data['register_accepted'] = registerAccepted;
    data['register_date'] = registerDate;
    data['subscription_is_valid_now'] = subscriptionIsValidNow;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  ProfileDetails toDomain() {
    return ProfileDetails(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      registerSubscriptionDuration: registerSubscriptionDuration,
      phone: phone,
      address: address,
      emailVerifiedAt:
          emailVerifiedAt != null ? DateTime.tryParse(emailVerifiedAt!) : null,
      emailIsVerified: emailIsVerified,
      verificationCode: verificationCode,
      imagePath: imagePath,
      registerAccepted: registerAccepted,
      registerDate: registerDate,
      subscriptionIsValidNow: subscriptionIsValidNow,
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
    );
  }
}

class DBLastSubscription {
  int? id;
  String? subscriptionableType;
  int? subscriptionableId;
  String? subscriptionFrom;
  String? subscriptionTo;
  int? subscriptionIsValid;
  int? subscriptionValue;
  String? createdAt;
  String? updatedAt;

  DBLastSubscription({
    this.id,
    this.subscriptionableType,
    this.subscriptionableId,
    this.subscriptionFrom,
    this.subscriptionTo,
    this.subscriptionIsValid,
    this.subscriptionValue,
    this.createdAt,
    this.updatedAt,
  });

  DBLastSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriptionableType = json['subscriptionable_type'];
    subscriptionableId = json['subscriptionable_id'];
    subscriptionFrom = json['subscription_from'];
    subscriptionTo = json['subscription_to'];
    subscriptionIsValid = json['subscription_is_valid'];
    subscriptionValue = json['subscription_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subscriptionable_type'] = subscriptionableType;
    data['subscriptionable_id'] = subscriptionableId;
    data['subscription_from'] = subscriptionFrom;
    data['subscription_to'] = subscriptionTo;
    data['subscription_is_valid'] = subscriptionIsValid;
    data['subscription_value'] = subscriptionValue;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  LastSubscription toDomain() {
    return LastSubscription(
      id: id,
      subscriptionableType: subscriptionableType,
      subscriptionableId: subscriptionableId,
      subscriptionFrom: DateTime.tryParse(subscriptionFrom ?? ''),
      subscriptionTo: DateTime.tryParse(subscriptionTo ?? ''),
      subscriptionIsValid: subscriptionIsValid,
      subscriptionValue: subscriptionValue,
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
    );
  }
}
