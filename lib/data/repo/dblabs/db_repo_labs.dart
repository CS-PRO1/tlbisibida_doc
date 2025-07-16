// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:tlbisibida_doc/data/models/bills/db_show_bill_details.dart';
import 'package:tlbisibida_doc/data/models/bills/db_show_lab_bills.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_latest_acc.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_mylabs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_unsub_labs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_unsub_lab_datails.dart';
import 'package:tlbisibida_doc/data/models/dentist labs/db_account_record.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_show_labs-send%20case%20to%20lab.dart';
import 'package:tlbisibida_doc/domain/repo/labs/doc_repo_labs.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbRepoLabs implements DocRepoLabs {
  @override
  DBAllLabsResponse? dbAllLabsResponse;

  @override
  DBLabDetailsResponse? dbLabDetailsResponse;

  @override
  DBLabsJoinedResponse? dbLabsJoinedResponse;

  @override
  DBLabsResponse? dbLabsResponse;

  @override
  DBLabBillsResponse? dbLabBillsResponse;

  @override
  Future<void> getAllLabDetails(int id) async {
    return await DioHelper.getData(
            'dentist/labs/show_lab_not_injoied_details/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbLabDetailsResponse = DBLabDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAllLabDetails: ' + error.toString());
    });
  }

  @override
  Future<void> getAllLabs() async {
    return await DioHelper.getData(
            'dentist/labs/show_all_labs_dentist_not_injoied?page=1',
            token: CacheHelper.get('token'))
        .then((value) {
      dbAllLabsResponse = DBAllLabsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAllLabs: ' + error.toString());
    });
  }

  @override
  DBBillDetailsResponse? dbBillDetailsResponse;

  @override
  Future<void> getBillDetails(int id) async {
    return await DioHelper.getData(
            'dentist/bills/show-bill-details-with-cases/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbBillDetailsResponse = DBBillDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getBillDetails: ' + error.toString());
    });
  }

  @override
  Future<void> getLabBills(int id) async {
    return await DioHelper.getData(
            'dentist/bills/show-lab-bills-descending/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbLabBillsResponse = DBLabBillsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getLabBills: ' + error.toString());
    });
  }

  @override
  Future<void> getLabsListForChoice({int page = 1}) async {
    return await DioHelper.getData(
            'dentist/labs/show_all_labs_dentist_not_injoied?page=$page',
            token: CacheHelper.get('token'))
        .then((value) {
      dbLabsResponse = DBLabsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getLabsListForChoice: ' + error.toString());
    });
  }

  @override
  Future<void> getMyLabs() async {
    return await DioHelper.getData('dentist/labs/show_labs_dentist_injoied',
            token: CacheHelper.get('token'))
        .then((value) {
      dbLabsJoinedResponse = DBLabsJoinedResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getMyLabs: ' + error.toString());
    });
  }

  @override
  DBLatestLabAccountResponse? dbLatestLabAccountResponse;

  @override
  Future<void> getlatestacc(int id) async {
    return await DioHelper.getData(
            'dentist/labs/show_account_of_dentist_in_lab/$id',
            token: '')
        .then((value) {
      dbLatestLabAccountResponse =
          DBLatestLabAccountResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAppointments: ' + error.toString());
    });
  }

  @override
  DBAccountRecordsResponse? dbAccountRecordsResponse;

  @override
  Future<void> getAccountRecordsOfLab(int labId) async {
    return await DioHelper.getData(
      'dentist/labs/Account_records_of_lab/$labId',
      token: CacheHelper.get('token'),
    ).then((value) {
      dbAccountRecordsResponse = DBAccountRecordsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAccountRecordsOfLab: ' + error.toString());
    });
  }

  @override
  Future<void> submitJoinRequestToLab(int labId) async {
    return await DioHelper.getData(
      'dentist/labs/submit_join_request_to_lab/$labId',
      token: CacheHelper.get('token'),
    ).then((value) {
      // Optionally handle response or store a message
    }).catchError((error) {
      print('error in submitJoinRequestToLab: ' + error.toString());
    });
  }
}
