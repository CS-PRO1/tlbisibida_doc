import 'package:tlbisibida_doc/domain/models/bills/show_bill_details.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_lab_bills.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/show_mylabs.dart';

abstract class LabsState {
  const LabsState();
}

class LabsInitial extends LabsState {}

class LabsLoading extends LabsState {}

class LabsError extends LabsState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const LabsError(this.message, {this.errorCode, this.stackTrace});
}

// My Labs
class MyLabsLoaded extends LabsState {
  final List<JoinedLab> myLabs;
  const MyLabsLoaded(this.myLabs);
}

// Lab Bills
class LabBillsLoaded extends LabsState {
  final List<BillItem> labBills;
  const LabBillsLoaded(this.labBills);
}

// Dentist Credit
class DentistCreditLoaded extends LabsState {
  final int currentAccount;
  const DentistCreditLoaded(this.currentAccount);
}

// Bill Details
class BillDetailsLoaded extends LabsState {
  final BillDetailsData billDetails;
  const BillDetailsLoaded(this.billDetails);
}

// Lab List from Choice
class LabListFromChoiceLoaded extends LabsState {
  final List<JoinedLab> labsList;
  const LabListFromChoiceLoaded(this.labsList);
}
