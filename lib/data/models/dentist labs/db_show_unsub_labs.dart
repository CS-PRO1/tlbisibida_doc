class DBAllLabsResponse {
  bool? status;
  int? successCode;
  AllLabsPaginationData? allLabs; // Renamed to reflect content
  String? successMessage;

  DBAllLabsResponse({
    this.status,
    this.successCode,
    this.allLabs,
    this.successMessage,
  });

  factory DBAllLabsResponse.fromJson(Map<String, dynamic> json) {
    return DBAllLabsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      allLabs: json[' Latest Account of this lab '] != null
          ? AllLabsPaginationData.fromJson(
              json[' Latest Account of this lab '] as Map<String, dynamic>)
          : null,
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (allLabs != null) {
      data[' Latest Account of this lab '] =
          allLabs!.toJson(); // Keep original key for serialization
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class AllLabsPaginationData {
  int? currentPage;
  List<LabInfo>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>?
      links; // Reusing the Link class if defined elsewhere, or define here
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  AllLabsPaginationData({
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

  factory AllLabsPaginationData.fromJson(Map<String, dynamic> json) {
    return AllLabsPaginationData(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LabInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((e) => e.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((e) => e.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class LabInfo {
  int? id;
  String? labName;
  String? labLogo;

  LabInfo({
    this.id,
    this.labName,
    this.labLogo,
  });

  factory LabInfo.fromJson(Map<String, dynamic> json) {
    return LabInfo(
      id: json['id'] as int?,
      labName: json['lab_name'] as String?,
      labLogo: json['lab_logo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lab_name'] = labName;
    data['lab_logo'] = labLogo;
    return data;
  }
}

// Assuming Link class is similar to what you might have already,
// otherwise, define it as follows:
class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
