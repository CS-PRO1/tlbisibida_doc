class ProfileResponse {
  final bool? status;
  final int? successCode;
  final Profile? profile;
  final String? successMessage;

  ProfileResponse({
    this.status,
    this.successCode,
    this.profile,
    this.successMessage,
  });
}

class Profile {
  final ProfileDetails? profileDetails;
  final LastSubscription? lastSubscription;

  Profile({
    this.profileDetails,
    this.lastSubscription,
  });
}

class ProfileDetails {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? registerSubscriptionDuration;
  final int? phone;
  final String? address;
  final DateTime? emailVerifiedAt;
  final int? emailIsVerified;
  final String? verificationCode;
  final String? imagePath;
  final String? registerAccepted;
  final String? registerDate;
  final String? subscriptionIsValidNow;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileDetails({
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
}

class LastSubscription {
  final int? id;
  final String? subscriptionableType;
  final int? subscriptionableId;
  final DateTime? subscriptionFrom;
  final DateTime? subscriptionTo;
  final int? subscriptionIsValid;
  final int? subscriptionValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LastSubscription({
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
}
