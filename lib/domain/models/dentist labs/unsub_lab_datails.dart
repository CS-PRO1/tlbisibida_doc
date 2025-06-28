class LabDetailsResponse {
  bool? status;
  int? successCode;
  LabDetails? labDetails; // Corrected to match JSON key " Lab Details "
  String? successMessage;

  LabDetailsResponse({
    this.status,
    this.successCode,
    this.labDetails,
    this.successMessage,
  });

  factory LabDetailsResponse.fromJson(Map<String, dynamic> json) {
    return LabDetailsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      labDetails: json[' Lab Details '] != null
          ? LabDetails.fromJson(json[' Lab Details '] as Map<String, dynamic>)
          : null,
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labDetails != null) {
      data[' Lab Details '] = labDetails!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class LabDetails {
  String? fullName;
  String? labFromHour; // Consider parsing to TimeOfDay or DateTime
  String? labToHour; // Consider parsing to TimeOfDay or DateTime
  String?
      labPhone; // This is a JSON string, you'll need to decode it separately
  String? labName;
  String? labAddress;
  String? labLogo;
  String? labType;

  LabDetails({
    this.fullName,
    this.labFromHour,
    this.labToHour,
    this.labPhone,
    this.labName,
    this.labAddress,
    this.labLogo,
    this.labType,
  });

  factory LabDetails.fromJson(Map<String, dynamic> json) {
    return LabDetails(
      fullName: json['full_name'] as String?,
      labFromHour: json['lab_from_hour'] as String?,
      labToHour: json['lab_to_hour'] as String?,
      labPhone:
          json['lab_phone'] as String?, // Keep as String to handle inner JSON
      labName: json['lab_name'] as String?,
      labAddress: json['lab_address'] as String?,
      labLogo: json['lab_logo'] as String?,
      labType: json['lab_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['lab_from_hour'] = labFromHour;
    data['lab_to_hour'] = labToHour;
    data['lab_phone'] = labPhone;
    data['lab_name'] = labName;
    data['lab_address'] = labAddress;
    data['lab_logo'] = labLogo;
    data['lab_type'] = labType;
    return data;
  }
}
