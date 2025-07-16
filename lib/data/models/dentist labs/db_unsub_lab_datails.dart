import '../../../domain/models/dentist labs/unsub_lab_datails.dart';

class DBLabDetailsResponse {
  bool? status;
  int? successCode;
  DBLabDetails? labDetails; // Corrected to match JSON key " Lab Details "
  String? successMessage;

  DBLabDetailsResponse({
    this.status,
    this.successCode,
    this.labDetails,
    this.successMessage,
  });

  factory DBLabDetailsResponse.fromJson(Map<String, dynamic> json) {
    return DBLabDetailsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      labDetails: json[' Lab Details '] != null
          ? DBLabDetails.fromJson(json[' Lab Details '] as Map<String, dynamic>)
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

class DBLabDetails {
  int? id;
  String? fullName;
  String? labFromHour; // Consider parsing to TimeOfDay or DateTime
  String? labToHour; // Consider parsing to TimeOfDay or DateTime
  String?
      labPhone; // This is a JSON string, you'll need to decode it separately
  String? labName;
  String? labAddress;
  String? labLogo;
  String? labType;

  DBLabDetails({
    this.id,
    this.fullName,
    this.labFromHour,
    this.labToHour,
    this.labPhone,
    this.labName,
    this.labAddress,
    this.labLogo,
    this.labType,
  });

  factory DBLabDetails.fromJson(Map<String, dynamic> json) {
    return DBLabDetails(
      id: json['id'] as int?,
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
    data['id'] = id;
    data['full_name'] = fullName;
    data['lab_from_hour'] = labFromHour;
    data['lab_to_hour'] = labToHour;
    data['lab_phone'] = labPhone;
    data['lab_name'] = labName;
    data['lab_address'] = labAddress;
    data['lab_logo'] = labLogo;
    data['lab_type'] = labType;
    return data;
  } // --- TO DOMAIN FUNCTION ---

  LabDetails toDomain() {
    return LabDetails(
      id: id,
      fullName: fullName,
      labFromHour: labFromHour,
      labToHour: labToHour,
      // If labPhone needs to be parsed into a different type (e.g., List<String> or a custom Phone object)
      // in the domain layer, you'd do that parsing here:
      // Example: labPhone: labPhone != null ? jsonDecode(labPhone!) as List<String> : null,
      labPhone: labPhone, // Currently, just passing the String
      labName: labName,
      labAddress: labAddress,
      labLogo: labLogo,
      labType: labType,
    );
  }

  // --- FROM DOMAIN FUNCTION ---
  static DBLabDetails fromDomain(LabDetails domain) {
    return DBLabDetails(
      id: domain.id,
      fullName: domain.fullName,
      labFromHour: domain.labFromHour,
      labToHour: domain.labToHour,
      // If labPhone was parsed in toDomain, you'd convert it back to a JSON string here:
      // Example: labPhone: domain.labPhone != null ? jsonEncode(domain.labPhone) : null,
      labPhone: domain.labPhone, // Currently, just passing the String
      labName: domain.labName,
      labAddress: domain.labAddress,
      labLogo: domain.labLogo,
      labType: domain.labType,
    );
  }
}
