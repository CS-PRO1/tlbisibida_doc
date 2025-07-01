// class TreatmentsStatisticsResponse {
//   bool? status;
//   int? successCode;
//   Map<String, MonthTreatmentStatistics>? treatmentsStatistics;
//   String? successMessage;

//   TreatmentsStatisticsResponse({
//     this.status,
//     this.successCode,
//     this.treatmentsStatistics,
//     this.successMessage,
//   });

//   factory TreatmentsStatisticsResponse.fromJson(Map<String, dynamic> json) {
//     return TreatmentsStatisticsResponse(
//       status: json['status'] as bool?,
//       successCode: json['success_code'] as int?,
//       treatmentsStatistics:
//           (json['treatments_statistics'] as Map<String, dynamic>?)?.map(
//         (key, value) => MapEntry(
//           key,
//           MonthTreatmentStatistics.fromJson(value as Map<String, dynamic>),
//         ),
//       ),
//       successMessage: json['success_message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (treatmentsStatistics != null) {
//       data['treatments_statistics'] = treatmentsStatistics!
//           .map((key, value) => MapEntry(key, value.toJson()));
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class MonthTreatmentStatistics {
  int? restoration; // "ترميم"
  int? rootCanal; // "سحب عصب"
  int? surgicalExtraction; // "قلع جراحي"

  MonthTreatmentStatistics({
    this.restoration,
    this.rootCanal,
    this.surgicalExtraction,
  });

  factory MonthTreatmentStatistics.fromJson(Map<String, dynamic> json) {
    return MonthTreatmentStatistics(
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
  }
}
