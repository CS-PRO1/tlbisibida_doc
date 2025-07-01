// class PatientsPaymentsFromToResponse {
//   bool? status;
//   int? successCode;
//   List<PatientBalance>? patientsPayments;
//   String? successMessage;

//   PatientsPaymentsFromToResponse({
//     this.status,
//     this.successCode,
//     this.patientsPayments,
//     this.successMessage,
//   });

//   PatientsPaymentsFromToResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     successCode = json['success_code'];
//     if (json['patients_payments'] != null) {
//       patientsPayments = <PatientBalance>[];
//       json['patients_payments'].forEach((v) {
//         patientsPayments!.add(PatientBalance.fromJson(v));
//       });
//     }
//     successMessage = json['success_message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['success_code'] = successCode;
//     if (patientsPayments != null) {
//       data['patients_payments'] =
//           patientsPayments!.map((v) => v.toJson()).toList();
//     }
//     data['success_message'] = successMessage;
//     return data;
//   }
// }

class PatientBalance {
  int? id;
  String? fullName;
  int? currentBalance;

  PatientBalance({
    this.id,
    this.fullName,
    this.currentBalance,
  });

  PatientBalance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    currentBalance = json['current_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['current_balance'] = currentBalance;
    return data;
  }
}
