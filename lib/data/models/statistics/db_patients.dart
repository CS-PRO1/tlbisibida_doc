import '../../../domain/models/statistics/patients.dart';

class DBPatientStatisticsResponse {
  bool? status;
  int? successCode;
  List<DBPatientStatistic>?
      patientsStatistic; // Corrected to match JSON key "paitents_statistic"
  String? successMessage;

  DBPatientStatisticsResponse({
    this.status,
    this.successCode,
    this.patientsStatistic,
    this.successMessage,
  });

  factory DBPatientStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return DBPatientStatisticsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      patientsStatistic: (json['paitents_statistic'] as List<dynamic>?)
          ?.map((e) => DBPatientStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (patientsStatistic != null) {
      data['paitents_statistic'] =
          patientsStatistic!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBPatientStatistic {
  int? month;
  int? patientCount;

  DBPatientStatistic({
    this.month,
    this.patientCount,
  });

  factory DBPatientStatistic.fromJson(Map<String, dynamic> json) {
    return DBPatientStatistic(
      month: json['month'] as int?,
      patientCount: json['patient_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['patient_count'] = patientCount;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  // Since DBPatientStatistic and PatientStatistic are identical, the mapping is direct.
  PatientStatistic toDomain() {
    return PatientStatistic(
      month: month,
      patientCount: patientCount,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBPatientStatistic and PatientStatistic are identical, the mapping is direct.
  static DBPatientStatistic fromDomain(PatientStatistic domain) {
    return DBPatientStatistic(
      month: domain.month,
      patientCount: domain.patientCount,
    );
  }
}
