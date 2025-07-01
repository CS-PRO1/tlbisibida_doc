import '../../../domain/models/statistics/doc_gains.dart';

class DBDoctorGainsStatisticsResponse {
  bool? status;
  int? successCode;
  List<DBDoctorGainsStatistic>? doctorGainsStatistics;
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
          ?.map(
              (e) => DBDoctorGainsStatistic.fromJson(e as Map<String, dynamic>))
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

class DBDoctorGainsStatistic {
  int? monthNumber;
  int? income;
  int? outcome;
  int? gain;

  DBDoctorGainsStatistic({
    this.monthNumber,
    this.income,
    this.outcome,
    this.gain,
  });

  factory DBDoctorGainsStatistic.fromJson(Map<String, dynamic> json) {
    return DBDoctorGainsStatistic(
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
  } // --- TO DOMAIN FUNCTION ---

  // Since DBDoctorGainsStatistic and DoctorGainsStatistic are identical, the mapping is direct.
  DoctorGainsStatistic toDomain() {
    return DoctorGainsStatistic(
      monthNumber: monthNumber,
      income: income,
      outcome: outcome,
      gain: gain,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  // Since DBDoctorGainsStatistic and DoctorGainsStatistic are identical, the mapping is direct.
  static DBDoctorGainsStatistic fromDomain(DoctorGainsStatistic domain) {
    return DBDoctorGainsStatistic(
      monthNumber: domain.monthNumber,
      income: domain.income,
      outcome: domain.outcome,
      gain: domain.gain,
    );
  }
}
