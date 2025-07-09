class PatientsResponse {
  final bool? status;
  final int? successCode;
  final PaginatedPatients? patients;
  final String? successMessage;

  PatientsResponse({
    this.status,
    this.successCode,
    this.patients,
    this.successMessage,
  });
}

class PaginatedPatients {
  final int? currentPage;
  final List<PatientData> data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  PaginatedPatients({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });
}

class PatientData {
  final int? id;
  final int? dentistId;
  final String? fullName;
  final String? address;
  final String? phone;
  final String? birthday;
  final int? currentBalance;
  final int? isSmoker;
  final String? gender;
  final String? medicineName;
  final String? illnessName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PatientData({
    this.id,
    this.dentistId,
    this.fullName,
    this.address,
    this.phone,
    this.birthday,
    this.currentBalance,
    this.isSmoker,
    this.gender,
    this.medicineName,
    this.illnessName,
    this.createdAt,
    this.updatedAt,
  });
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });
}
