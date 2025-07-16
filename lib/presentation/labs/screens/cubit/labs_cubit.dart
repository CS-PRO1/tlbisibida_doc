import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_bill_details.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_lab_bills.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/show_mylabs.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/show_unsub_labs.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/account_record.dart';
import 'package:tlbisibida_doc/domain/models/dentist labs/unsub_lab_datails.dart';
import 'package:tlbisibida_doc/domain/repo/labs/doc_repo_labs.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_states.dart';

class LabsCubit extends Cubit<LabsState> {
  final DocRepoLabs repo;

  LabsCubit(this.repo) : super(LabsInitial());

  LabsIamJoind? myLabsIamJoind;
  Future<void> getmylabslist() async {
    emit(LabsLoading());
    try {
      await repo.getMyLabs();
      myLabsIamJoind = repo.dbLabsJoinedResponse?.labsIamJoind?.toDomain();
      if (myLabsIamJoind != null) {
        emit(MyLabsLoaded(myLabsIamJoind!));
      } else {
        emit(LabsError('لم يتم العثور على قائمة المخابر.'));
      }
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل قائمة المخابر.', stackTrace: stack));
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

  List<JoinedLabWithAccount> labslistfromcchoice = [];
  Future<void> getlablistfromchoice() async {
    emit(LabsLoading());
    labslistfromcchoice.clear();
    try {
      await repo.getMyLabs();
      final labsWithAccounts = repo.dbLabsJoinedResponse?.labsIamJoind
              ?.toDomain()
              .labsWithAccounts ??
          [];
      labslistfromcchoice.addAll(labsWithAccounts);
      emit(LabListFromChoiceLoaded(labslistfromcchoice));
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل قائمة المخابر.', stackTrace: stack));
    }
  }

  List<AccountRecord> accountRecordsList = [];
  Future<void> getAccountRecordsOfLab(int labId) async {
    emit(LabsLoading());
    accountRecordsList.clear();
    try {
      await repo.getAccountRecordsOfLab(labId);
      final records = repo.dbAccountRecordsResponse?.accountRecords;
      if (records != null) {
        accountRecordsList = records.map((e) => e.toDomain()).toList();
        emit(LabsAccountRecordsLoaded(accountRecordsList));
      } else {
        emit(LabsError('لم يتم العثور على سجلات الحساب.'));
      }
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل سجلات الحساب.', stackTrace: stack));
    }
  }

  AllLabsPaginationData? unsubscribedLabsData;
  int _currentPage = 1;
  bool _hasMore = true;
  Future<void> getUnsubscribedLabs({bool nextPage = false}) async {
    if (nextPage) {
      if (!_hasMore || unsubscribedLabsData == null) return;
      _currentPage++;
    } else {
      _currentPage = 1;
      unsubscribedLabsData = null;
      _hasMore = true;
      emit(LabsLoading());
    }
    try {
      await repo.getLabsListForChoice(page: _currentPage);
      final labsData = repo.dbAllLabsResponse?.allLabs;
      if (labsData != null) {
        if (nextPage && unsubscribedLabsData != null) {
          // Append new data to the existing list
          unsubscribedLabsData = AllLabsPaginationData(
            currentPage: labsData.toDomain().currentPage,
            data: [
              ...?unsubscribedLabsData?.data,
              ...?labsData.toDomain().data,
            ],
            firstPageUrl: labsData.toDomain().firstPageUrl,
            from: labsData.toDomain().from,
            lastPage: labsData.toDomain().lastPage,
            lastPageUrl: labsData.toDomain().lastPageUrl,
            links: labsData.toDomain().links,
            nextPageUrl: labsData.toDomain().nextPageUrl,
            path: labsData.toDomain().path,
            perPage: labsData.toDomain().perPage,
            prevPageUrl: labsData.toDomain().prevPageUrl,
            to: labsData.toDomain().to,
            total: labsData.toDomain().total,
          );
        } else {
          unsubscribedLabsData = labsData.toDomain();
        }
        _hasMore = labsData.nextPageUrl != null;
        emit(LabsUnsubscribedLabsLoaded(unsubscribedLabsData!));
      } else {
        emit(LabsError('لم يتم العثور على المخابر غير المنضمة.'));
      }
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل المخابر غير المنضمة.',
          stackTrace: stack));
    }
  }

  LabDetails? unsubscribedLabDetails;
  Future<void> getUnsubscribedLabDetails(int id) async {
    emit(LabsLoading());
    try {
      await repo.getAllLabDetails(id);
      final details = repo.dbLabDetailsResponse?.labDetails;
      if (details != null) {
        unsubscribedLabDetails = details.toDomain();
        emit(LabsUnsubscribedLabDetailsLoaded(unsubscribedLabDetails!));
      } else {
        emit(LabsError('لم يتم العثور على تفاصيل المخبر.'));
      }
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء تحميل تفاصيل المخبر.', stackTrace: stack));
    }
  }

  int focusedLabIndex = 0;
  void setFocusedLabIndex(int index) {
    focusedLabIndex = index;
    emit(LabsUnsubscribedLabsLoaded(unsubscribedLabsData!));
  }

  Future<void> submitJoinRequestToLab(int labId) async {
    emit(LabsLoading());
    try {
      await repo.submitJoinRequestToLab(labId);
      emit(LabsSuccess('تم إرسال الطلب بنجاح.'));
    } catch (e, stack) {
      emit(LabsError('حدث خطأ أثناء إرسال طلب الانضمام.', stackTrace: stack));
    }
  }
}
