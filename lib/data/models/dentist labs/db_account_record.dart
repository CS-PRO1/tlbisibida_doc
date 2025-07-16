import '../../../domain/models/dentist labs/account_record.dart';

class DBAccountRecordsResponse {
  bool? status;
  int? successCode;
  List<DBAccountRecord>? accountRecords;
  String? successMessage;

  DBAccountRecordsResponse({
    this.status,
    this.successCode,
    this.accountRecords,
    this.successMessage,
  });

  factory DBAccountRecordsResponse.fromJson(Map<String, dynamic> json) {
    return DBAccountRecordsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      accountRecords: (json['AccountRecords of this lab'] as List<dynamic>?)
          ?.map((e) => DBAccountRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (accountRecords != null) {
      data['AccountRecords of this lab'] =
          accountRecords!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  AccountRecordsResponse toDomain() {
    return AccountRecordsResponse(
      status: status,
      successCode: successCode,
      accountRecords: accountRecords?.map((e) => e.toDomain()).toList(),
      successMessage: successMessage,
    );
  }
}

class DBAccountRecord {
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
  String? createdAt;
  String? updatedAt;

  DBAccountRecord({
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

  factory DBAccountRecord.fromJson(Map<String, dynamic> json) {
    return DBAccountRecord(
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
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  // --- TO DOMAIN FUNCTION ---
  AccountRecord toDomain() {
    return AccountRecord(
      id: id,
      dentistId: dentistId,
      labManagerId: labManagerId,
      billId: billId,
      creatorableType: creatorableType,
      creatorableId: creatorableId,
      signedValue: signedValue,
      note: note,
      type: type,
      currentAccount: currentAccount,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBAccountRecord fromDomain(AccountRecord domain) {
    return DBAccountRecord(
      id: domain.id,
      dentistId: domain.dentistId,
      labManagerId: domain.labManagerId,
      billId: domain.billId,
      creatorableType: domain.creatorableType,
      creatorableId: domain.creatorableId,
      signedValue: domain.signedValue,
      note: domain.note,
      type: domain.type,
      currentAccount: domain.currentAccount,
      createdAt: domain.createdAt?.toIso8601String(),
      updatedAt: domain.updatedAt?.toIso8601String(),
    );
  }
}
