import '../../../domain/models/clinic scheduals/show_clinic_times.dart';

class DBDentistScheduleResponse {
  bool? status;
  int? successCode;
  List<DBDentistSchedule>? dentistSchedule;
  String? successMessage;

  DBDentistScheduleResponse({
    this.status,
    this.successCode,
    this.dentistSchedule,
    this.successMessage,
  });

  DBDentistScheduleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['dentist_schedule'] != null) {
      dentistSchedule = <DBDentistSchedule>[];
      json['dentist_schedule'].forEach((v) {
        dentistSchedule!.add(DBDentistSchedule.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (dentistSchedule != null) {
      data['dentist_schedule'] =
          dentistSchedule!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBDentistSchedule {
  int? id;
  int? dentistId;
  String? day;
  String?
      startTime; // Consider parsing to TimeOfDay or DateTime if needed for time calculations
  String? endTime; // Consider parsing to TimeOfDay or DateTime if needed
  String? startRest; // Can be null
  String? endRest; // Can be null
  String? createdAt; // Can be parsed to DateTime if needed
  String? updatedAt; // Can be parsed to DateTime if needed

  DBDentistSchedule({
    this.id,
    this.dentistId,
    this.day,
    this.startTime,
    this.endTime,
    this.startRest,
    this.endRest,
    this.createdAt,
    this.updatedAt,
  });

  DBDentistSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dentistId = json['dentist_id'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startRest = json['start_rest'];
    endRest = json['end_rest'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['day'] = day;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['start_rest'] = startRest;
    data['end_rest'] = endRest;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  // >>>>>>>>>>>>>> TO DOMAIN FUNCTION <<<<<<<<<<<<<<
  DentistSchedule toDomain() {
    return DentistSchedule(
      id: id,
      dentistId: dentistId,
      day: day,
      startTime: startTime,
      endTime: endTime,
      startRest: startRest,
      endRest: endRest,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // >>>>>>>>>>>>>> FROM DOMAIN FUNCTION <<<<<<<<<<<<<<
  static DBDentistSchedule fromDomain(DentistSchedule domain) {
    return DBDentistSchedule(
      id: domain.id,
      dentistId: domain.dentistId,
      day: domain.day,
      startTime: domain.startTime,
      endTime: domain.endTime,
      startRest: domain.startRest,
      endRest: domain.endRest,
      createdAt: domain.createdAt,
      updatedAt: domain.updatedAt,
    );
  }
}
