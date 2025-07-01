import '../../../domain/models/dentist labs/latest_acc.dart';

class DBLatestLabAccountResponse {
  bool? status;
  int? successCode;
  DBLatestAccountData?
      latestAccountOfThisLab; // Corrected to match JSON key " Latest Account of this lab "
  String? successMessage;

  DBLatestLabAccountResponse({
    this.status,
    this.successCode,
    this.latestAccountOfThisLab,
    this.successMessage,
  });

  factory DBLatestLabAccountResponse.fromJson(Map<String, dynamic> json) {
    return DBLatestLabAccountResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      latestAccountOfThisLab: json[' Latest Account of this lab '] != null
          ? DBLatestAccountData.fromJson(
              json[' Latest Account of this lab '] as Map<String, dynamic>)
          : null,
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (latestAccountOfThisLab != null) {
      data[' Latest Account of this lab '] = latestAccountOfThisLab!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBLatestAccountData {
  int? currentAccount;

  DBLatestAccountData({
    this.currentAccount,
  });

  factory DBLatestAccountData.fromJson(Map<String, dynamic> json) {
    return DBLatestAccountData(
      currentAccount: json['current_account'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_account'] = currentAccount;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  // Since DBLatestAccount and LatestAccount are identical, the mapping is direct.
  LatestAccount toDomain() {
    return LatestAccount(
      currentAccount: currentAccount,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBLatestAccount and LatestAccount are identical, the mapping is direct.
  static DBLatestAccountData fromDomain(LatestAccount domain) {
    return DBLatestAccountData(
      currentAccount: domain.currentAccount,
    );
  }
}
