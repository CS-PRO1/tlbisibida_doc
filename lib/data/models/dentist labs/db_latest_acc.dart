class LatestLabAccountResponse {
  bool? status;
  int? successCode;
  LatestAccountData?
      latestAccountOfThisLab; // Corrected to match JSON key " Latest Account of this lab "
  String? successMessage;

  LatestLabAccountResponse({
    this.status,
    this.successCode,
    this.latestAccountOfThisLab,
    this.successMessage,
  });

  factory LatestLabAccountResponse.fromJson(Map<String, dynamic> json) {
    return LatestLabAccountResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      latestAccountOfThisLab: json[' Latest Account of this lab '] != null
          ? LatestAccountData.fromJson(
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

class LatestAccountData {
  int? currentAccount;

  LatestAccountData({
    this.currentAccount,
  });

  factory LatestAccountData.fromJson(Map<String, dynamic> json) {
    return LatestAccountData(
      currentAccount: json['current_account'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_account'] = currentAccount;
    return data;
  }
}
