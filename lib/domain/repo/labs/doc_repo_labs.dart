import 'package:tlbisibida_doc/data/models/bills/db_show_bill_details.dart';
import 'package:tlbisibida_doc/data/models/bills/db_show_lab_bills.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_latest_acc.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_mylabs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_unsub_labs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_unsub_lab_datails.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_show_labs-send%20case%20to%20lab.dart';

abstract class DocRepoLabs {
  //labs
  DBLabDetailsResponse? dbLabDetailsResponse;
  DBAllLabsResponse? dbAllLabsResponse;
  DBLabsResponse? dbLabsResponse;
  DBLabsJoinedResponse? dbLabsJoinedResponse;

  //bills
  DBBillDetailsResponse? dbBillDetailsResponse;
  DBLabBillsResponse? dbLabBillsResponse;

  //credit
  DBLatestLabAccountResponse? dbLatestLabAccountResponse;

  Future<void> getLabBills(int id);
  Future<void> getBillDetails(int id);
  Future<void> getMyLabs();
  Future<void> getAllLabs();
  Future<void> getAllLabDetails(int id);
  Future<void> getLabsListForChoice();
  Future<void> getlatestacc(int id);
}
