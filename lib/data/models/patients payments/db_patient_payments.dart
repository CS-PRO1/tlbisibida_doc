class DBPatientPaymentsResponse {
  bool? status;
  int? successCode;
  List<PatientPayment>? patientPayments;
  String? successMessage;

  DBPatientPaymentsResponse({
    this.status,
    this.successCode,
    this.patientPayments,
    this.successMessage,
  });

  DBPatientPaymentsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['patient_payments'] != null) {
      patientPayments = <PatientPayment>[];
      json['patient_payments'].forEach((v) {
        patientPayments!.add(PatientPayment.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (patientPayments != null) {
      data['patient_payments'] =
          patientPayments!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class PatientPayment {
  int? id;
  int? value;
  String? paymentDate; // Consider parsing to DateTime if needed

  PatientPayment({
    this.id,
    this.value,
    this.paymentDate,
  });

  PatientPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    paymentDate = json['payment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['payment_date'] = paymentDate;
    return data;
  }
}
