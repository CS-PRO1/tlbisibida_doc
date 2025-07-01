// class OperatingPaymentsResponse {
//   bool? status;
//   int? successCode;
//   List<OperatingPayment>? operatingPayments;
//   String? successMessage;

//   OperatingPaymentsResponse({
//     this.status,
//     this.successCode,
//     this.operatingPayments,
//     this.successMessage,
//   });

//   factory OperatingPaymentsResponse.fromJson(Map<String, dynamic> json) {
//     return OperatingPaymentsResponse(
//       status: json['status'] as bool?,
//       successCode: json['success_code'] as int?,
//       operatingPayments: (json['operating_payments'] as List<dynamic>?)
//           ?.map((e) => OperatingPayment.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       successMessage: json['success_message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (operatingPayments != null) {
//       data['operating_payments'] =
//           operatingPayments!.map((e) => e.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class OperatingPayment {
  int? id;
  String? creatorableType;
  int? creatorableId;
  String? name;
  int? value;
  String? createdAt; // Consider parsing to DateTime if you need date objects
  String? updatedAt; // Consider parsing to DateTime if you need date objects

  OperatingPayment({
    this.id,
    this.creatorableType,
    this.creatorableId,
    this.name,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory OperatingPayment.fromJson(Map<String, dynamic> json) {
    return OperatingPayment(
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
  }
}
