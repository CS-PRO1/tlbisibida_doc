import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_bill_details.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_lab_bills.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/show_mylabs.dart';
import 'package:tlbisibida_doc/domain/repo/labs/doc_repo_labs.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_states.dart';

class LabsCubit extends Cubit<LabsState> {
  final DocRepoLabs repo;

  LabsCubit(this.repo) : super(LabsInitial());

  List<JoinedLab> mylabslist = [];
  Future<void> getmylabslist() async {
    emit(LabsLoading());
    mylabslist.clear();
    try {
      await repo.getMyLabs();
      for (var caseitem in repo.dbLabsJoinedResponse!.labsIamJoind!) {
        mylabslist.add(caseitem.toDomain());
      }
      emit(MyLabsLoaded(mylabslist));
    } catch (e, stack) {
      emit(
          LabsError('حدث خطأ أثناء تحميل قائمة المخابر.', stackTrace: stack));
    }
  }

  List<BillItem> labbillslist = [];
  Future<void> getLabBills(int id) async {
    emit(LabsLoading());
    labbillslist.clear();
    try {
      await repo.getLabBills(id);
      for (var bill in repo.dbLabBillsResponse!.labBills!.bills!) {
        labbillslist.add(bill.toDomain());
      }
      emit(LabBillsLoaded(labbillslist));
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل الفواتير.', stackTrace: stack));
    }
  }

  int? currentaccount;
  Future<void> getDentistCredit(int id) async {
    emit(LabsLoading());
    try {
      await repo.getlatestacc(id);
      currentaccount = repo
          .dbLatestLabAccountResponse!.latestAccountOfThisLab!.currentAccount;
      if (currentaccount != null) {
        emit(DentistCreditLoaded(currentaccount!));
      } else {
        emit(LabsError('لم يتم العثور على رصيد الطبيب.'));
      }
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل رصيد الطبيب.', stackTrace: stack));
    }
  }

  BillDetailsData? currentbill;
  Future<void> getBillDetails(int id) async {
    emit(LabsLoading());
    try {
      await repo.getBillDetails(id);
      currentbill = repo.dbBillDetailsResponse!.billDetails!.toDomain();
      if (currentbill != null) {
        emit(BillDetailsLoaded(currentbill!));
      } else {
        emit(LabsError('لم يتم العثور على تفاصيل الفاتورة.'));
      }
    } catch (e, stack) {
      emit(
          LabsError('حدث خطأ أثناء تحميل تفاصيل الفاتورة.', stackTrace: stack));
    }
  }

  List<JoinedLab> labslistfromcchoice = [];
  Future<void> getlablistfromchoice() async {
    emit(LabsLoading());
    labslistfromcchoice.clear();
    try {
      await repo.getMyLabs();
      for (var caseitem in repo.dbLabsJoinedResponse!.labsIamJoind!) {
        labslistfromcchoice.add(caseitem.toDomain());
      }
      emit(LabListFromChoiceLoaded(labslistfromcchoice));
    } catch (e, stack) {
      emit(
          LabsError('حدث خطأ أثناء تحميل قائمة المخابر.', stackTrace: stack));
    }
  }
}
