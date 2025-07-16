class AccountRecordsResponse {
  bool? status;
  int? successCode;
  List<AccountRecord>? accountRecords;
  String? successMessage;

  AccountRecordsResponse({
    this.status,
    this.successCode,
    this.accountRecords,
    this.successMessage,
  });
}

class AccountRecord {
  int? id;
  int? dentistId;
  int? labManagerId;
  int? billId;
  String? creatorableType;
  int? creatorableId;
  int? signedValue;
  String? note;
  String? type;
  int? currentAccount;
  DateTime? createdAt;
  DateTime? updatedAt;

  AccountRecord({
    this.id,
    this.dentistId,
    this.labManagerId,
    this.billId,
    this.creatorableType,
    this.creatorableId,
    this.signedValue,
    this.note,
    this.type,
    this.currentAccount,
    this.createdAt,
    this.updatedAt,
  });

  factory AccountRecord.fromJson(Map<String, dynamic> json) {
    return AccountRecord(
      id: json['id'] as int?,
      dentistId: json['dentist_id'] as int?,
      labManagerId: json['lab_manager_id'] as int?,
      billId: json['bill_id'] as int?,
      creatorableType: json['creatorable_type'] as String?,
      creatorableId: json['creatorable_id'] as int?,
      signedValue: json['signed_value'] as int?,
      note: json['note'] as String?,
      type: json['type'] as String?,
      currentAccount: json['current_account'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    data['bill_id'] = billId;
    data['creatorable_type'] = creatorableType;
    data['creatorable_id'] = creatorableId;
    data['signed_value'] = signedValue;
    data['note'] = note;
    data['type'] = type;
    data['current_account'] = currentAccount;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    return data;
  }
}
