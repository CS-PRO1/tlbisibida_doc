// // labs_response.dart

// class LabsResponse {
//   bool? status;
//   int? successCode;
//   List<LabNameItem>? labs;
//   String? successMessage;

//   LabsResponse({
//     this.status,
//     this.successCode,
//     this.labs,
//     this.successMessage,
//   });

//   LabsResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     successCode = json['success_code'];
//     if (json['labs'] != null) {
//       labs = <LabNameItem>[];
//       json['labs'].forEach((v) {
//         labs!.add(LabNameItem.fromJson(v));
//       });
//     }
//     successMessage = json['success_message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (labs != null) {
//       data['labs'] = labs!.map((v) => v.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class LabNameItem {
  String? labName;

  LabNameItem({this.labName});

  LabNameItem.fromJson(Map<String, dynamic> json) {
    labName = json['lab_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lab_name'] = labName;
    return data;
  }
}
