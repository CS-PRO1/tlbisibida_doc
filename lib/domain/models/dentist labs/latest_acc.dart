// domain/models/latest_account/latest_account_response.dart
class LatestAccountResponse {
  bool? status;
  int? successCode;
  LatestAccount? latestAccount; // Renamed for idiomatic Dart
  String? successMessage;

  LatestAccountResponse({
    this.status,
    this.successCode,
    this.latestAccount,
    this.successMessage,
  });
}

// domain/models/latest_account/latest_account.dart
class LatestAccount {
  int? currentAccount;

  LatestAccount({
    this.currentAccount,
  });
}
