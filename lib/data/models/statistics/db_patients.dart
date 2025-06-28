class DBPatientStatisticsResponse {
  bool? status;
  int? successCode;
  List<PatientStatistic>?
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
          ?.map((e) => PatientStatistic.fromJson(e as Map<String, dynamic>))
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

class PatientStatistic {
  int? month;
  int? patientCount;

  PatientStatistic({
    this.month,
    this.patientCount,
  });

  factory PatientStatistic.fromJson(Map<String, dynamic> json) {
    return PatientStatistic(
      month: json['month'] as int?,
      patientCount: json['patient_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['patient_count'] = patientCount;
    return data;
  }
}
