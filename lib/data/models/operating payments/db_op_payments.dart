import '../../../domain/models/operating payments/op_payments.dart';

class DBOperatingPaymentsResponse {
  bool? status;
  int? successCode;
  List<DBOperatingPayment>? operatingPayments;
  String? successMessage;

  DBOperatingPaymentsResponse({
    this.status,
    this.successCode,
    this.operatingPayments,
    this.successMessage,
  });

  factory DBOperatingPaymentsResponse.fromJson(Map<String, dynamic> json) {
    return DBOperatingPaymentsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      operatingPayments: (json['operating_payments'] as List<dynamic>?)
          ?.map((e) => DBOperatingPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (operatingPayments != null) {
      data['operating_payments'] =
          operatingPayments!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBOperatingPayment {
  int? id;
  String? creatorableType;
  int? creatorableId;
  String? name;
  int? value;
  String? createdAt; // Consider parsing to DateTime if you need date objects
  String? updatedAt; // Consider parsing to DateTime if you need date objects

  DBOperatingPayment({
    this.id,
    this.creatorableType,
    this.creatorableId,
    this.name,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory DBOperatingPayment.fromJson(Map<String, dynamic> json) {
    return DBOperatingPayment(
      id: json['id'] as int?,
      creatorableType: json['creatorable_type'] as String?,
      creatorableId: json['creatorable_id'] as int?,
      name: json['name'] as String?,
      value: json['value'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['creatorable_type'] = creatorableType;
    data['creatorable_id'] = creatorableId;
    data['name'] = name;
    data['value'] = value;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  OperatingPayment toDomain() {
    return OperatingPayment(
      id: id,
      creatorableType: creatorableType,
      creatorableId: creatorableId,
      name: name,
      value: value,
      createdAt: createdAt, // Convert String to DateTime
      updatedAt: updatedAt, // Convert String to DateTime
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBOperatingPayment fromDomain(OperatingPayment domain) {
    return DBOperatingPayment(
      id: domain.id,
      creatorableType: domain.creatorableType,
      creatorableId: domain.creatorableId,
      name: domain.name,
      value: domain.value,
      createdAt: domain.createdAt, // Convert DateTime to String
      updatedAt: domain.updatedAt, // Convert DateTime to String
    );
  }
}
