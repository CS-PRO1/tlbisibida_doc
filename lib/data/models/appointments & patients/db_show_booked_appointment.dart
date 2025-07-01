import '../../../domain/models/appoinments & patients/show_booked_appointment.dart';

class DBAppointmentsResponse {
  bool? status;
  int? successCode;
  List<DBAppointment>? appointments;
  String? successMessage;

  DBAppointmentsResponse({
    this.status,
    this.successCode,
    this.appointments,
    this.successMessage,
  });

  factory DBAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return DBAppointmentsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      appointments: (json['appointments'] as List<dynamic>?)
          ?.map((e) => DBAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (appointments != null) {
      data['appointments'] = appointments!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class DBAppointment {
  int? id;
  int? dentistId;
  String? creatorableType;
  int? creatorableId;
  String? patientName;
  String? patientPhone;
  String? timeFrom; // Consider parsing to TimeOfDay or DateTime
  String? timeTo; // Consider parsing to TimeOfDay or DateTime
  String? date; // Consider parsing to DateTime
  String? createdAt; // Consider parsing to DateTime
  String? updatedAt; // Can be null, consider parsing to DateTime

  DBAppointment({
    this.id,
    this.dentistId,
    this.creatorableType,
    this.creatorableId,
    this.patientName,
    this.patientPhone,
    this.timeFrom,
    this.timeTo,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory DBAppointment.fromJson(Map<String, dynamic> json) {
    return DBAppointment(
      id: json['id'] as int?,
      dentistId: json['dentist_id'] as int?,
      creatorableType: json['creatorable_type'] as String?,
      creatorableId: json['creatorable_id'] as int?,
      patientName: json['patient_name'] as String?,
      patientPhone: json['patient_phone'] as String?,
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      date: json['date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['creatorable_type'] = creatorableType;
    data['creatorable_id'] = creatorableId;
    data['patient_name'] = patientName;
    data['patient_phone'] = patientPhone;
    data['time_from'] = timeFrom;
    data['time_to'] = timeTo;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  Appointment todomain() {
    return Appointment(
        createdAt: createdAt,
        creatorableId: creatorableId,
        creatorableType: creatorableType,
        date: date,
        dentistId: dentistId,
        id: id,
        patientName: patientName,
        patientPhone: patientPhone,
        timeFrom: timeFrom,
        timeTo: timeTo,
        updatedAt: updatedAt);
  }

  static DBAppointment fromjson(Appointment ap) {
    return DBAppointment()
      ..createdAt = ap.createdAt
      ..creatorableId = ap.creatorableId
      ..creatorableType = ap.creatorableType
      ..dentistId = ap.dentistId
      ..patientName = ap.patientName
      ..patientPhone = ap.patientPhone
      ..timeFrom = ap.timeFrom
      ..timeTo = ap.timeTo
      ..updatedAt = ap.updatedAt
      ..id = ap.id
      ..date = ap.date;
  }
}
