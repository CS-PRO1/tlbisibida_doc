import '../../../domain/models/dentist labs/show_mylabs.dart';

class DBLabsJoinedResponse {
  bool? status;
  int? successCode;
  DBLabsIamJoind? labsIamJoind;
  String? successMessage;

  DBLabsJoinedResponse({
    this.status,
    this.successCode,
    this.labsIamJoind,
    this.successMessage,
  });

  factory DBLabsJoinedResponse.fromJson(Map<String, dynamic> json) {
    return DBLabsJoinedResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      labsIamJoind: json['labs iam joind'] != null
          ? DBLabsIamJoind.fromJson(
              json['labs iam joind'] as Map<String, dynamic>)
          : null,
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labsIamJoind != null) {
      data['labs iam joind'] = labsIamJoind!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBLabsIamJoind {
  int? labId;
  List<DBJoinedLab>? labs;
  List<DBDentistAccount>? dentistAccounts;

  DBLabsIamJoind({this.labId, this.labs, this.dentistAccounts});

  factory DBLabsIamJoind.fromJson(Map<String, dynamic> json) {
    return DBLabsIamJoind(
      labId: json['lab_id'] as int?,
      labs: (json['labs'] as List<dynamic>?)
          ?.map((e) => DBJoinedLab.fromJson(e as Map<String, dynamic>))
          .toList(),
      dentistAccounts: (json['dentist_accounts'] as List<dynamic>?)
          ?.map((e) => DBDentistAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_id'] = labId;
    if (labs != null) {
      data['labs'] = labs!.map((e) => e.toJson()).toList();
    }
    if (dentistAccounts != null) {
      data['dentist_accounts'] =
          dentistAccounts!.map((e) => e.toJson()).toList();
    }
    return data;
  }

  LabsIamJoind toDomain() {
    final labsList = labs ?? [];
    final accountsList = dentistAccounts ?? [];
    List<JoinedLabWithAccount> merged = [];
    for (int i = 0; i < labsList.length; i++) {
      final lab = labsList[i];
      final account = i < accountsList.length ? accountsList[i] : null;
      merged.add(JoinedLabWithAccount(
        labId: lab.labId,
        labName: lab.labName,
        labLogo: lab.labLogo,
        pivot: lab.pivot?.toDomain(),
        labManagerId: account?.labManagerId,
        currentAccount: account?.currentAccount,
      ));
    }
    return LabsIamJoind(labsWithAccounts: merged);
  }

  static DBLabsIamJoind fromDomain(LabsIamJoind domain) {
    // Not needed for this use case, but could be implemented if needed
    throw UnimplementedError();
  }
}

class DBDentistAccount {
  int? labManagerId;
  int? currentAccount;

  DBDentistAccount({this.labManagerId, this.currentAccount});

  factory DBDentistAccount.fromJson(Map<String, dynamic> json) {
    return DBDentistAccount(
      labManagerId: json['lab_manager_id'] as int?,
      currentAccount: json['current_account'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_manager_id'] = labManagerId;
    data['current_account'] = currentAccount;
    return data;
  }
}

class DBJoinedLab {
  int? labId;
  String? labName;
  String? labLogo;
  DBPivot? pivot;

  DBJoinedLab({
    this.labId,
    this.labName,
    this.labLogo,
    this.pivot,
  });

  factory DBJoinedLab.fromJson(Map<String, dynamic> json) {
    return DBJoinedLab(
      labId: json['lab_id'] as int?,
      labName: json['lab_name'] as String?,
      labLogo: json['lab_logo'] as String?,
      pivot: json['pivot'] != null
          ? DBPivot.fromJson(json['pivot'] as Map<String, dynamic>)
          : null,
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
    return data;
  }
}

class DBPivot {
  int? dentistId;
  int? labManagerId;

  DBPivot({this.dentistId, this.labManagerId});

  factory DBPivot.fromJson(Map<String, dynamic> json) {
    return DBPivot(
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

  Pivot toDomain() {
    return Pivot(
      dentistId: dentistId,
      labManagerId: labManagerId,
    );
  }
}
