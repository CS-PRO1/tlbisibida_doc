import 'package:tlbisibida_doc/domain/models/bills/show_bill_details.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_lab_bills.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/show_mylabs.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/account_record.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/show_unsub_labs.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/unsub_lab_datails.dart';

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

class LabsSuccess extends LabsState {
  final String message;
  const LabsSuccess(this.message);
}

// My Labs
class MyLabsLoaded extends LabsState {
  final LabsIamJoind myLabs;
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
  final List<JoinedLabWithAccount> labsList;
  const LabListFromChoiceLoaded(this.labsList);
}

// Account Records
class LabsAccountRecordsLoaded extends LabsState {
  final List<AccountRecord> accountRecords;
  const LabsAccountRecordsLoaded(this.accountRecords);
}

// Unsubscribed Labs
class LabsUnsubscribedLabsLoaded extends LabsState {
  final AllLabsPaginationData labsData;
  const LabsUnsubscribedLabsLoaded(this.labsData);
}

// Unsubscribed Lab Details
class LabsUnsubscribedLabDetailsLoaded extends LabsState {
  final LabDetails labDetails;
  const LabsUnsubscribedLabDetailsLoaded(this.labDetails);
}
