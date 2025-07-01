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
