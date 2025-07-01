import '../../../domain/models/statistics/treatments.dart';

class DBTreatmentsStatisticsResponse {
  bool? status;
  int? successCode;
  Map<String, DBMonthTreatmentStatistics>? treatmentsStatistics;
  String? successMessage;

  DBTreatmentsStatisticsResponse({
    this.status,
    this.successCode,
    this.treatmentsStatistics,
    this.successMessage,
  });

  factory DBTreatmentsStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return DBTreatmentsStatisticsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      treatmentsStatistics:
          (json['treatments_statistics'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          DBMonthTreatmentStatistics.fromJson(value as Map<String, dynamic>),
        ),
      ),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (treatmentsStatistics != null) {
      data['treatments_statistics'] = treatmentsStatistics!
          .map((key, value) => MapEntry(key, value.toJson()));
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBMonthTreatmentStatistics {
  int? restoration; // "ترميم"
  int? rootCanal; // "سحب عصب"
  int? surgicalExtraction; // "قلع جراحي"

  DBMonthTreatmentStatistics({
    this.restoration,
    this.rootCanal,
    this.surgicalExtraction,
  });

  factory DBMonthTreatmentStatistics.fromJson(Map<String, dynamic> json) {
    return DBMonthTreatmentStatistics(
      restoration: json['ترميم'] as int?,
      rootCanal: json['سحب عصب'] as int?,
      surgicalExtraction: json['قلع جراحي'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ترميم'] = restoration;
    data['سحب عصب'] = rootCanal;
    data['قلع جراحي'] = surgicalExtraction;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  // Since DBMonthTreatmentStatistics and MonthTreatmentStatistics are identical, the mapping is direct.
  MonthTreatmentStatistics toDomain() {
    return MonthTreatmentStatistics(
      restoration: restoration,
      rootCanal: rootCanal,
      surgicalExtraction: surgicalExtraction,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBMonthTreatmentStatistics and MonthTreatmentStatistics are identical, the mapping is direct.
  static DBMonthTreatmentStatistics fromDomain(
      MonthTreatmentStatistics domain) {
    return DBMonthTreatmentStatistics(
      restoration: domain.restoration,
      rootCanal: domain.rootCanal,
      surgicalExtraction: domain.surgicalExtraction,
    );
  }
}
