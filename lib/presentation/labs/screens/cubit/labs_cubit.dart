import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_bill_details.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_lab_bills.dart';
import 'package:tlbisibida_doc/domain/models/dentist%20labs/show_mylabs.dart';
import 'package:tlbisibida_doc/domain/models/medical%20cases/show_labs-send%20case%20to%20lab.dart';
import 'package:tlbisibida_doc/domain/repo/labs/doc_repo_labs.dart';

class LabsCubit extends Cubit<String> {
  final DocRepoLabs repo;

  LabsCubit(this.repo) : super('');

  //get MY LABS list
  List<JoinedLab> mylabslist = [];
  Future<void> getmylabslist() async {
    emit('case_mylabslist_loading');
    try {
      await repo.getMyLabs();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    for (var caseitem in repo.dbLabsJoinedResponse!.labsIamJoind!) {
      mylabslist.add(caseitem.toDomain());
    }

    mylabslist.isNotEmpty ? emit('case_mylabslist_loaded') : emit('error');
    print(state);
  }

  //get  LAB BILLS  list
  List<BillItem> labbillslist = [];
  Future<void> getLabBills(int id) async {
    emit('case_lab_bills_list_loading');
    try {
      await repo.getLabBills(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    for (var bill in repo.dbLabBillsResponse!.labBills!.bills!) {
      labbillslist.add(bill.toDomain());
    }

    labbillslist.isNotEmpty ? emit('case_lab_bills_loaded') : emit('error');
    print(state);
  }

  //get credit for one lab
  int? currentaccount;
  Future<void> getDentistCredit(int id) async {
    emit('case_dentistcredit_loading');
    try {
      await repo.getlatestacc(id);
      currentaccount = repo
          .dbLatestLabAccountResponse!.latestAccountOfThisLab!.currentAccount;
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    currentaccount != null ? emit('case_dentistcredit_loaded') : emit('error');
    print(state);
  }

  //get bill details
  BillDetailsData? currentbill;
  Future<void> getBillDetails(int id) async {
    emit('case_billdetails_loading');
    try {
      await repo.getBillDetails(id);
      currentbill = repo.dbBillDetailsResponse!.billDetails!.toDomain();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    currentbill != null ? emit('case_billdetails_loaded') : emit('error');
    print(state);
  }

  //get lab list from choice
  List<LabNameItem> labslistfromcchoice = [];
  Future<void> getlablistfromchoice() async {
    emit('case_mylabslist_loading');
    try {
      await repo.getMyLabs();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    for (var caseitem in repo.dbLabsJoinedResponse!.labsIamJoind!) {
      mylabslist.add(caseitem.toDomain());
    }

    mylabslist.isNotEmpty ? emit('case_mylabslist_loaded') : emit('error');
    print(state);
  }
}
