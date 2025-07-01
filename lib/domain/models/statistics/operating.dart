// class OperatingPaymentsStatisticsResponse {
//   bool? status;
//   int? successCode;
//   List<OperatingPaymentStatistic>?
//       operatingPayments; // Corrected to match JSON key "Operating_Payments"
//   String? successMessage;

//   OperatingPaymentsStatisticsResponse({
//     this.status,
//     this.successCode,
//     this.operatingPayments,
//     this.successMessage,
//   });

//   factory OperatingPaymentsStatisticsResponse.fromJson(
//       Map<String, dynamic> json) {
//     return OperatingPaymentsStatisticsResponse(
//       status: json['status'] as bool?,
//       successCode: json['success_code'] as int?,
//       operatingPayments: (json['Operating_Payments'] as List<dynamic>?)
//           ?.map((e) =>
//               OperatingPaymentStatistic.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       successMessage: json['success_message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (operatingPayments != null) {
//       data['Operating_Payments'] =
//           operatingPayments!.map((e) => e.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class OperatingPaymentStatistic {
  String? name;
  int? totalValue;
  int? count;
  String?
      percentage; // Can be parsed to double if arithmetic operations are needed

  OperatingPaymentStatistic({
    this.name,
    this.totalValue,
    this.count,
    this.percentage,
  });

  factory OperatingPaymentStatistic.fromJson(Map<String, dynamic> json) {
    return OperatingPaymentStatistic(
      name: json['name'] as String?,
      totalValue: json['total_value'] as int?,
      count: json['count'] as int?,
      percentage: json['percentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['total_value'] = totalValue;
    data['count'] = count;
    data['percentage'] = percentage;
    return data;
  }
}
