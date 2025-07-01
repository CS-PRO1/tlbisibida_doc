// class AppointmentsResponse {
//   bool? status;
//   int? successCode;
//   List<Appointment>? appointments;
//   String? successMessage;

//   AppointmentsResponse({
//     this.status,
//     this.successCode,
//     this.appointments,
//     this.successMessage,
//   });

//   factory AppointmentsResponse.fromJson(Map<String, dynamic> json) {
//     return AppointmentsResponse(
//       status: json['status'] as bool?,
//       successCode: json['success_code'] as int?,
//       appointments: (json['appointments'] as List<dynamic>?)
//           ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       successMessage: json['success_message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (appointments != null) {
//       data['appointments'] = appointments!.map((e) => e.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class Appointment {
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

  Appointment({
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

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
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
}
