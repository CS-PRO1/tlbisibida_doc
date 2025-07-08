import 'dart:typed_data';

import 'package:tlbisibida_doc/data/models/medical%20cases/db_case_details.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_caseslist_from_lab.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_comments.dart';
import 'package:tlbisibida_doc/domain/repo/cases/doc_repo_cases.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbDocRepoCases implements DocRepoCases {
  @override
  DBCommentsResponse? dbCommentsResponse;

  @override
  DBMedicalCaseResponse? dbMedicalCaseResponse;

  @override
  DBMedicalCasesListResponse? dbMedicalCasesListResponse;
  @override
  Future<void> getcaseList(int id) async {
    return await DioHelper.getData(
            'dentist/medical-cases/show-lab-medical-cases/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbMedicalCasesListResponse =
          DBMedicalCasesListResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getcaseList: ' + error.toString());
    });
  }

  @override
  Future<void> getCaseDetails(int id) async {
    return await DioHelper.getData(
            'dentist/medical-cases/get-medical-case-details/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbMedicalCaseResponse = DBMedicalCaseResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getCaseDetails: ' + error.toString());
    });
  }

  @override
  Future<void> getComments(int id) async {
    return await DioHelper.getData('dentist/medical-cases/show-comments/$id',
            token: CacheHelper.get('token'))
        .then((value) {
      dbCommentsResponse = DBCommentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getComments: ' + error.toString());
    });
  }

  @override
  Future<bool> confirmDelivery(int id) async =>
      await DioHelper.getData('dentist/medical-cases/confirm-delivery/$id',
              token: CacheHelper.get('token'))
          .then((value) {
        if (value != null && value.data['status']) {
          return true;
        } else {
          print(" failed: ${value?.data['message'] ?? 'Unknown error'}");
          return false;
        }
      }).catchError((error) {
        print(error.toString());
        return false;
      });

  @override
  Future<Uint8List>? getimg(int id) async =>
      await DioHelper.getImage('dentist/medical-cases/download-case-image/$id',
              token: CacheHelper.get('token'))
          .then((value) {
        if (value != null && value.data['status']) {
          return value.data;
        } else {
          print(" failed: ${value?.data['message'] ?? 'Unknown error'}");
          return null;
        }
      }).catchError((error) {
        print(error.toString());
        return null;
      });

  // @override
  // Future<void> getCaseDetails(int id) {
  //   // TODO: implement getCaseDetails
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> getComments(int id) {
  //   // TODO: implement getComments
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> getcaseList(int id) {
  //   // TODO: implement getcaseList
  //   throw UnimplementedError();
  // }
}
