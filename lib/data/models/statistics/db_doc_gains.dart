class DBDoctorGainsStatisticsResponse {
  bool? status;
  int? successCode;
  List<DoctorGainsStatistic>? doctorGainsStatistics;
  String? successMessage;

  DBDoctorGainsStatisticsResponse({
    this.status,
    this.successCode,
    this.doctorGainsStatistics,
    this.successMessage,
  });

  factory DBDoctorGainsStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return DBDoctorGainsStatisticsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      doctorGainsStatistics: (json['doctor_gains_statistics'] as List<dynamic>?)
          ?.map((e) => DoctorGainsStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (doctorGainsStatistics != null) {
      data['doctor_gains_statistics'] =
          doctorGainsStatistics!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DoctorGainsStatistic {
  int? monthNumber;
  int? income;
  int? outcome;
  int? gain;

  DoctorGainsStatistic({
    this.monthNumber,
    this.income,
    this.outcome,
    this.gain,
  });

  factory DoctorGainsStatistic.fromJson(Map<String, dynamic> json) {
    return DoctorGainsStatistic(
      monthNumber: json['month_number'] as int?,
      income: json['income'] as int?,
      outcome: json['outcome'] as int?,
      gain: json['gain'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month_number'] = monthNumber;
    data['income'] = income;
    data['outcome'] = outcome;
    data['gain'] = gain;
    return data;
  }
}
