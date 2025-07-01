import 'package:tlbisibida_doc/domain/models/appoinments%20&%20patients/book_an_appointment.dart';

class DBAvailableSlotsResponse {
  String? date; // Consider parsing to DateTime if date object is preferred
  String? dayName;
  int? duration;
  List<TimeSlot>? availableSlots;

  DBAvailableSlotsResponse({
    this.date,
    this.dayName,
    this.duration,
    this.availableSlots,
  });

  factory DBAvailableSlotsResponse.fromJson(Map<String, dynamic> json) {
    return DBAvailableSlotsResponse(
      date: json['date'] as String?,
      dayName: json['day_name'] as String?,
      duration: json['duration'] as int?,
      availableSlots: (json['available_slots'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['day_name'] = dayName;
    data['duration'] = duration;
    if (availableSlots != null) {
      data['available_slots'] = availableSlots!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class DBTimeSlot {
  String?
      start; // Consider parsing to TimeOfDay or DateTime if precise time objects are needed
  String?
      end; // Consider parsing to TimeOfDay or DateTime if precise time objects are needed

  DBTimeSlot({
    this.start,
    this.end,
  });

  factory DBTimeSlot.fromJson(Map<String, dynamic> json) {
    return DBTimeSlot(
      start: json['start'] as String?,
      end: json['end'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    return data;
  }

  TimeSlot todomain() {
    return TimeSlot(start: start, end: end);
  }

  static DBTimeSlot fromdomain(TimeSlot timeslot) {
    return DBTimeSlot()
      ..start = timeslot.start
      ..end = timeslot.end;
  }
}
