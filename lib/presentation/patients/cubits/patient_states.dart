import 'package:tlbisibida_doc/domain/models/appoinments & patients/show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/all_patients.dart';
import 'package:tlbisibida_doc/domain/models/dentist sessions/show_patient_treatments.dart';
import 'package:tlbisibida_doc/domain/models/dentist sessions/show_treatment_details.dart';
import 'package:tlbisibida_doc/domain/models/patients payments/patient_payments.dart';
import 'package:tlbisibida_doc/domain/models/patients payments/patients_payment_from_to.dart';

abstract class PatientsState {
  const PatientsState();
}

class PatientsInitial extends PatientsState {}

// Patients List
class PatientsLoading extends PatientsState {}

class PatientsLoaded extends PatientsState {
  final List<PatientData> patients;
  final PaginatedPatients pagination;
  const PatientsLoaded(this.patients, this.pagination);
}

class PatientsError extends PatientsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const PatientsError(this.message, {this.errorCode, this.stackTrace});
}

// Patient Details
class PatientDetailsLoading extends PatientsState {}

class PatientDetailsLoaded extends PatientsState {
  final PatientDetails details;
  const PatientDetailsLoaded(this.details);
}

class PatientDetailsError extends PatientsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const PatientDetailsError(this.message, {this.errorCode, this.stackTrace});
}

// Patient Treatments
class PatientTreatmentsLoading extends PatientsState {}

class PatientTreatmentsLoaded extends PatientsState {
  final List<PatientTreatment> treatments;
  const PatientTreatmentsLoaded(this.treatments);
}

class PatientTreatmentsError extends PatientsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const PatientTreatmentsError(this.message, {this.errorCode, this.stackTrace});
}

// Treatment Details
class TreatmentDetailsLoading extends PatientsState {}

class TreatmentDetailsLoaded extends PatientsState {
  final TreatmentDetails details;
  const TreatmentDetailsLoaded(this.details);
}

class TreatmentDetailsError extends PatientsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const TreatmentDetailsError(this.message, {this.errorCode, this.stackTrace});
}

// Patient Payments
class PatientPaymentsLoading extends PatientsState {}

class PatientPaymentsLoaded extends PatientsState {
  final List<PatientPayment> payments;
  const PatientPaymentsLoaded(this.payments);
}

class PatientPaymentsError extends PatientsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const PatientPaymentsError(this.message, {this.errorCode, this.stackTrace});
}

// Patients Payments From-To
class PatientsPaymentsFromToLoading extends PatientsState {}

class PatientsPaymentsFromToLoaded extends PatientsState {
  final List<PatientBalance> balances;
  const PatientsPaymentsFromToLoaded(this.balances);
}

class PatientsPaymentsFromToError extends PatientsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const PatientsPaymentsFromToError(this.message,
      {this.errorCode, this.stackTrace});
}
