
import 'package:tlbisibida_doc/domain/models/appoinments%20&%20patients/all_patients.dart';

class DBPatientsResponse {
  bool? status;
  int? successCode;
  DBPaginatedPatients? patients;
  String? successMessage;

  DBPatientsResponse({
    this.status,
    this.successCode,
    this.patients,
    this.successMessage,
  });

  DBPatientsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    patients = json['patients'] != null
        ? DBPaginatedPatients.fromJson(json['patients'])
        : null;
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (patients != null) {
      data['patients'] = patients!.toJson();
    }
    data['success_message'] = successMessage;
    return data;
  }

  PatientsResponse toDomain() {
    return PatientsResponse(
      status: status,
      successCode: successCode,
      patients: patients?.toDomain(),
      successMessage: successMessage,
    );
  }
}

class DBPaginatedPatients {
  int? currentPage;
  List<DBPatientData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<DBLink>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  DBPaginatedPatients({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  DBPaginatedPatients.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DBPatientData>[];
      json['data'].forEach((v) {
        data!.add(DBPatientData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <DBLink>[];
      json['links'].forEach((v) {
        links!.add(DBLink.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }

  PaginatedPatients toDomain() {
    return PaginatedPatients(
      currentPage: currentPage,
      data: data?.map((e) => e.toDomain()).toList() ?? [],
      firstPageUrl: firstPageUrl,
      from: from,
      lastPage: lastPage,
      lastPageUrl: lastPageUrl,
      links: links?.map((e) => e.toDomain()).toList() ?? [],
      nextPageUrl: nextPageUrl,
      path: path,
      perPage: perPage,
      prevPageUrl: prevPageUrl,
      to: to,
      total: total,
    );
  }
}

class DBPatientData {
  int? id;
  int? dentistId;
  String? fullName;
  String? address;
  String? phone;
  String? birthday;
  int? currentBalance;
  int? isSmoker;
  String? gender;
  String? medicineName;
  String? illnessName;
  String? createdAt;
  String? updatedAt;

  DBPatientData({
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

  DBPatientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dentistId = json['dentist_id'];
    fullName = json['full_name'];
    address = json['address'];
    phone = json['phone'];
    birthday = json['birthday'];
    currentBalance = json['current_balance'];
    isSmoker = json['is_smoker'];
    gender = json['gender'];
    medicineName = json['medicine_name'];
    illnessName = json['illness_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dentist_id'] = dentistId;
    data['full_name'] = fullName;
    data['address'] = address;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['current_balance'] = currentBalance;
    data['is_smoker'] = isSmoker;
    data['gender'] = gender;
    data['medicine_name'] = medicineName;
    data['illness_name'] = illnessName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  PatientData toDomain() {
    return PatientData(
      id: id,
      dentistId: dentistId,
      fullName: fullName,
      address: address,
      phone: phone,
      birthday: birthday,
      currentBalance: currentBalance,
      isSmoker: isSmoker,
      gender: gender,
      medicineName: medicineName,
      illnessName: illnessName,
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
    );
  }
}

class DBLink {
  String? url;
  String? label;
  bool? active;

  DBLink({this.url, this.label, this.active});

  DBLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }

  Link toDomain() {
    return Link(
      url: url,
      label: label,
      active: active,
    );
  }
}

// Domain Models (to be defined in your domain layer)

