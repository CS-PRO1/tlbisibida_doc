class AvailableSlotsResponse {
  String? date; // Consider parsing to DateTime if date object is preferred
  String? dayName;
  int? duration;
  List<TimeSlot>? availableSlots;

  AvailableSlotsResponse({
    this.date,
    this.dayName,
    this.duration,
    this.availableSlots,
  });

  factory AvailableSlotsResponse.fromJson(Map<String, dynamic> json) {
    return AvailableSlotsResponse(
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

class TimeSlot {
  String?
      start; // Consider parsing to TimeOfDay or DateTime if precise time objects are needed
  String?
      end; // Consider parsing to TimeOfDay or DateTime if precise time objects are needed

  TimeSlot({
    this.start,
    this.end,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
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
}
