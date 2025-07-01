import '../../../domain/models/statistics/operating.dart';

class DBOperatingPaymentsStatisticsResponse {
  bool? status;
  int? successCode;
  List<DBOperatingPaymentStatistic>?
      operatingPayments; // Corrected to match JSON key "Operating_Payments"
  String? successMessage;

  DBOperatingPaymentsStatisticsResponse({
    this.status,
    this.successCode,
    this.operatingPayments,
    this.successMessage,
  });

  factory DBOperatingPaymentsStatisticsResponse.fromJson(
      Map<String, dynamic> json) {
    return DBOperatingPaymentsStatisticsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      operatingPayments: (json['Operating_Payments'] as List<dynamic>?)
          ?.map((e) =>
              DBOperatingPaymentStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (operatingPayments != null) {
      data['Operating_Payments'] =
          operatingPayments!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBOperatingPaymentStatistic {
  String? name;
  int? totalValue;
  int? count;
  String?
      percentage; // Can be parsed to double if arithmetic operations are needed

  DBOperatingPaymentStatistic({
    this.name,
    this.totalValue,
    this.count,
    this.percentage,
  });

  factory DBOperatingPaymentStatistic.fromJson(Map<String, dynamic> json) {
    return DBOperatingPaymentStatistic(
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
  } // --- TO DOMAIN FUNCTION ---

  OperatingPaymentStatistic toDomain() {
    return OperatingPaymentStatistic(
      name: name,
      totalValue: totalValue,
      count: count,
      percentage: percentage, // Convert String to double
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBOperatingPaymentStatistic fromDomain(
      OperatingPaymentStatistic domain) {
    return DBOperatingPaymentStatistic(
      name: domain.name,
      totalValue: domain.totalValue,
      count: domain.count,
      percentage: domain.percentage?.toString(), // Convert double to String
    );
  }
}
