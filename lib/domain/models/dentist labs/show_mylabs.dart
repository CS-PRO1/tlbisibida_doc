// class LabsJoinedResponse {
//   bool? status;
//   int? successCode;
//   List<JoinedLab>? labsIamJoind; // Corrected to match JSON key "labs iam joind"
//   String? successMessage;

//   LabsJoinedResponse({
//     this.status,
//     this.successCode,
//     this.labsIamJoind,
//     this.successMessage,
//   });

//   factory LabsJoinedResponse.fromJson(Map<String, dynamic> json) {
//     return LabsJoinedResponse(
//       status: json['status'] as bool?,
//       successCode: json['success_code'] as int?,
//       labsIamJoind: (json['labs iam joind'] as List<dynamic>?)
//           ?.map((e) => JoinedLab.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       successMessage: json['success_message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (labsIamJoind != null) {
//       data['labs iam joind'] = labsIamJoind!.map((e) => e.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class JoinedLabWithAccount {
  int? labId;
  String? labName;
  String? labLogo;
  Pivot? pivot;
  int? labManagerId;
  int? currentAccount;

  JoinedLabWithAccount({
    this.labId,
    this.labName,
    this.labLogo,
    this.pivot,
    this.labManagerId,
    this.currentAccount,
  });

  factory JoinedLabWithAccount.fromJson(Map<String, dynamic> json) {
    return JoinedLabWithAccount(
      labId: json['lab_id'] as int?,
      labName: json['lab_name'] as String?,
      labLogo: json['lab_logo'] as String?,
      pivot: json['pivot'] != null
          ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>)
          : null,
      labManagerId: json['lab_manager_id'] as int?,
      currentAccount: json['current_account'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_id'] = labId;
    data['lab_name'] = labName;
    data['lab_logo'] = labLogo;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    data['lab_manager_id'] = labManagerId;
    data['current_account'] = currentAccount;
    return data;
  }
}

class LabsIamJoind {
  List<JoinedLabWithAccount>? labsWithAccounts;

  LabsIamJoind({this.labsWithAccounts});

  factory LabsIamJoind.fromJson(Map<String, dynamic> json) {
    final labs = (json['labs'] as List<dynamic>?) ?? [];
    final accounts = (json['dentist_accounts'] as List<dynamic>?) ?? [];
    // Merge by index (assuming both lists are in the same order and length)
    List<JoinedLabWithAccount> merged = [];
    for (int i = 0; i < labs.length; i++) {
      final lab = labs[i] as Map<String, dynamic>;
      final account =
          i < accounts.length ? accounts[i] as Map<String, dynamic> : {};
      merged.add(JoinedLabWithAccount(
        labId: lab['lab_id'] as int?,
        labName: lab['lab_name'] as String?,
        labLogo: lab['lab_logo'] as String?,
        pivot: lab['pivot'] != null
            ? Pivot.fromJson(lab['pivot'] as Map<String, dynamic>)
            : null,
        labManagerId: account['lab_manager_id'] as int?,
        currentAccount: account['current_account'] as int?,
      ));
    }
    return LabsIamJoind(labsWithAccounts: merged);
  }

  Map<String, dynamic> toJson() {
    return {
      'labsWithAccounts': labsWithAccounts?.map((e) => e.toJson()).toList(),
    };
  }
}

class Pivot {
  int? dentistId;
  int? labManagerId;

  Pivot({
    this.dentistId,
    this.labManagerId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      dentistId: json['dentist_id'] as int?,
      labManagerId: json['lab_manager_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    return data;
  }
}
