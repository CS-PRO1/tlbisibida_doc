class TreatmentDetails {
  int? id;
  int? patientId;
  int? dentistId;
  int? medicalCaseId; // Can be null
  int? cost;
  String? title;
  String? type;
  String? details;
  String? date; // Consider parsing to DateTime if needed
  bool? isPaid; // Consider using bool?
  String? createdAt; // Consider parsing to DateTime
  String? updatedAt; // Consider parsing to DateTime
  List<TreatmentImage>? images;

  TreatmentDetails({
    this.id,
    this.patientId,
    this.dentistId,
    this.medicalCaseId,
    this.cost,
    this.title,
    this.type,
    this.details,
    this.date,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  factory TreatmentDetails.fromJson(Map<String, dynamic> json) {
    return TreatmentDetails(
      id: json['id'] as int?,
      patientId: json['patient_id'] as int?,
      dentistId: json['dentist_id'] as int?,
      medicalCaseId: json['medical_case_id'] as int?,
      cost: json['cost'] as int?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      details: json['details'] as String?,
      date: json['date'] as String?,
      isPaid: json['is_paid'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => TreatmentImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['dentist_id'] = dentistId;
    data['medical_case_id'] = medicalCaseId;
    data['cost'] = cost;
    data['title'] = title;
    data['type'] = type;
    data['details'] = details;
    data['date'] = date;
    data['is_paid'] = isPaid;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class TreatmentImage {
  int? id;
  int? treatmentId;
  String? name;
  bool? isDiagram; // Consider using bool?

  TreatmentImage({
    this.id,
    this.treatmentId,
    this.name,
    this.isDiagram,
  });

  factory TreatmentImage.fromJson(Map<String, dynamic> json) {
    return TreatmentImage(
      id: json['id'] as int?,
      treatmentId: json['treatment_id'] as int?,
      name: json['name'] as String?,
      isDiagram: json['is_diagram'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['treatment_id'] = treatmentId;
    data['name'] = name;
    data['is_diagram'] = isDiagram;
    return data;
  }
}
