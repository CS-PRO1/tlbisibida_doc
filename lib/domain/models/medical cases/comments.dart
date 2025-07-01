// class CommentsResponse {
//   bool? status;
//   int? successCode;
//   List<Comment>? comments;
//   String? successMessage;

//   CommentsResponse({
//     this.status,
//     this.successCode,
//     this.comments,
//     this.successMessage,
//   });

//   CommentsResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     successCode = json['success_code'];
//     if (json['comments'] != null) {
//       comments = <Comment>[];
//       json['comments'].forEach((v) {
//         comments!.add(Comment.fromJson(v));
//       });
//     }
//     successMessage = json['success_message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (comments != null) {
//       data['comments'] = comments!.map((v) => v.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class Comment {
  int? id;
  int? medicalCaseId;
  int? dentistId;
  int? labManagerId;
  String? comment;
  String? createdAt; // Consider parsing to DateTime if you need date objects
  String? updatedAt; // Consider parsing to DateTime if you need date objects

  Comment({
    this.id,
    this.medicalCaseId,
    this.dentistId,
    this.labManagerId,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicalCaseId = json['medical_case_id'];
    dentistId = json['dentist_id'];
    labManagerId = json['lab_manager_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medical_case_id'] = medicalCaseId;
    data['dentist_id'] = dentistId;
    data['lab_manager_id'] = labManagerId;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
