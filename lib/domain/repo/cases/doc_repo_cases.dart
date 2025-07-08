import 'dart:typed_data';

import 'package:tlbisibida_doc/data/models/medical%20cases/db_case_details.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_caseslist_from_lab.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_comments.dart';

abstract class DocRepoCases {
  //cases
  DBMedicalCaseResponse? dbMedicalCaseResponse;
  DBCommentsResponse? dbCommentsResponse;
  DBMedicalCasesListResponse? dbMedicalCasesListResponse;

  //get func
  Future<void> getCaseDetails(int id);
  Future<void> getcaseList(int id);
  Future<void> getComments(int id);
  Future<bool> confirmDelivery(int id);
  Future<Uint8List>? getimg(int id);
}
