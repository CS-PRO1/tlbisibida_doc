// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:tlbisibida_doc/data/models/clinic%20scheduals/db_show_clinic_times.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_rare_n_repeated_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_cats.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_items_log.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_quants_for_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_subcats.dart';
import 'package:tlbisibida_doc/data/models/operating%20payments/db_op_payments.dart';
import 'package:tlbisibida_doc/data/models/secretary/db_secretaries.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_doc_gains.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_operating.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_patients.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_subcat.dart';
import 'package:tlbisibida_doc/data/models/statistics/db_treatments.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';

import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbDocRepo implements DocRepo {
  @override
  DBCategoriesResponse? dbCategoriesResponse;
  Future<void> getCats() async {
    return await DioHelper.getData('inventory/categories', token: '')
        .then((value) {
      dbCategoriesResponse = DBCategoriesResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getCats: ' + error.toString());
    });
  }

  @override
  DBDentistScheduleResponse? dbDentistScheduleResponse;
  Future<void> getClinicTimes() async {
    return await DioHelper.getData('dentist/show-times', token: '')
        .then((value) {
      dbDentistScheduleResponse =
          DBDentistScheduleResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getClinicTimes: ' + error.toString());
    });
  }

  DBDoctorGainsStatisticsResponse? dbDoctorGainsStatisticsResponse;
  @override
  Future<void> getDocGainsStatistics() async {
    return await DioHelper.getData('dentist/statistics/doctor_gains_statistics',
            token: '')
        .then((value) {
      dbDoctorGainsStatisticsResponse =
          DBDoctorGainsStatisticsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getDocGainsStatistics: ' + error.toString());
    });
  }

  DBItemsResponse? dbItemsResponse;
  @override
  Future<void> getItems(int id) async {
    return await DioHelper.getData('inventory/items/$id', token: '')
        .then((value) {
      dbItemsResponse = DBItemsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getItems: ' + error.toString());
    });
  }

  DBRepeatedItemsResponse? dbRepeatedItemsResponse;
  @override
  Future<void> getItemsLog() async {
    return await DioHelper.getData('inventory/Repeated_item_histories',
            token: '')
        .then((value) {
      dbRepeatedItemsResponse = DBRepeatedItemsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getItemsLog: ' + error.toString());
    });
  }

  DBOperatingPaymentsResponse? dbOperatingPaymentsResponse;
  @override
  Future<void> getOpPayments() async {
    return await DioHelper.getData('operating-payments/get-all', token: '')
        .then((value) {
      dbOperatingPaymentsResponse =
          DBOperatingPaymentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getOpPayments: ' + error.toString());
    });
  }

  DBOperatingPaymentsStatisticsResponse? dbOperatingPaymentsStatisticsResponse;
  @override
  Future<void> getOpPaymentsStatistics() async {
    return await DioHelper.getData(
            'dentist/statistics/Operating_Payment_statistics',
            token: '')
        .then((value) {
      dbOperatingPaymentsStatisticsResponse =
          DBOperatingPaymentsStatisticsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getOpPaymentsStatistics: ' + error.toString());
    });
  }

  DBPatientStatisticsResponse? dbPatientStatisticsResponse;
  @override
  Future<void> getPatientsStatistics() async {
    return await DioHelper.getData('dentist/statistics/paitents_statistics',
            token: '')
        .then((value) {
      dbPatientStatisticsResponse =
          DBPatientStatisticsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientsStatistics: ' + error.toString());
    });
  }

  DBItemQuantityHistoryResponse? dbItemQuantityHistoryResponse;
  @override
  Future<void> getQuantities(int id) async {
    return await DioHelper.getData('inventory/itemhistories/$id', token: '')
        .then((value) {
      dbItemQuantityHistoryResponse =
          DBItemQuantityHistoryResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getQuantities: ' + error.toString());
    });
  }

  DBNonRepeatedItemsResponse? dbNonRepeatedItemsResponse;
  @override
  Future<void> getRareItems() async {
    return await DioHelper.getData('inventory/Non_Repeated_item_histories',
            token: '')
        .then((value) {
      dbNonRepeatedItemsResponse =
          DBNonRepeatedItemsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getRareItems: ' + error.toString());
    });
  }

  DBSecretariesResponse? dbSecretariesResponse;
  @override
  Future<void> getSecretaries() async {
    return await DioHelper.getData('dentist/secretaries', token: '')
        .then((value) {
      dbSecretariesResponse = DBSecretariesResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getSecretaries: ' + error.toString());
    });
  }

  DBSubcategoryStatisticsResponse? dbSubcategoryStatisticsResponse;
  @override
  Future<void> getSubCatStatistics() async {
    return await DioHelper.getData(
            'dentist/statistics/sub_categories_statistics',
            token: '')
        .then((value) {
      dbSubcategoryStatisticsResponse =
          DBSubcategoryStatisticsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getSubCatStatistics: ' + error.toString());
    });
  }

  DBSubCategoryRepositoriesResponse? dbSubCategoryRepositoriesResponse;
  @override
  Future<void> getSubCats(int id) async {
    return await DioHelper.getData('inventory/items/$id', token: '')
        .then((value) {
      dbSubCategoryRepositoriesResponse =
          DBSubCategoryRepositoriesResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getSubCats: ' + error.toString());
    });
  }

  DBTreatmentsStatisticsResponse? dbTreatmentsStatisticsResponse;
  @override
  Future<void> getTreatmentStatistics() async {
    return await DioHelper.getData('dentist/statistics/treatments_statistics',
            token: '')
        .then((value) {
      dbTreatmentsStatisticsResponse =
          DBTreatmentsStatisticsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getTreatmentStatistics: ' + error.toString());
    });
  }

  @override
  Future<bool> delSecretary(int id) async => await DioHelper.deleteData(
        'dentist/secretaries/delete/$id',
      ).then((value) {
        if (value != null && value.data['status']) {
          CacheHelper.setString(
              'token', 'Bearer ' + value.data['data']['access_token']);
          print("Login successful. Token: ${CacheHelper.get('token')}");
          return true;
        } else {
          print("Login failed: ${value?.data['message'] ?? 'Unknown error'}");
          return false;
        }
      }).catchError((error) {
        print(error.toString());
        return false;
      });

  @override
  Future<bool> postAddSecretary(String firstName, String lastName, String phone,
          String email, String attendenceTime, String address) async =>
      await DioHelper.postData('dentist/secretaries/addsecretary', {
        'firstname': firstName,
        'lastname': lastName,
        'phone': phone,
        'email': email,
        'attendencetime': attendenceTime,
        'address': address
      }).then((value) {
        if (value != null && value.data['status']) {
          CacheHelper.setString(
              'token', 'Bearer ' + value.data['data']['access_token']);
          print(" successful. Token: ${CacheHelper.get('token')}");
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
  Future<bool> updateSecretary(
          int id,
          String firstName,
          String lastName,
          String phone,
          String email,
          String attendenceTime,
          String address) async =>
      await DioHelper.updateData('dentist/secretaries/update/$id', {
        'firstname': firstName,
        'lastname': lastName,
        'phone': phone,
        'email': email,
        'attendencetime': attendenceTime,
        'address': address
      }).then((value) {
        if (value != null && value.data['status']) {
          CacheHelper.setString(
              'token', 'Bearer ' + value.data['data']['access_token']);
          print(" successful. Token: ${CacheHelper.get('token')}");
          return true;
        } else {
          print(" failed: ${value?.data['message'] ?? 'Unknown error'}");
          return false;
        }
      }).catchError((error) {
        print(error.toString());
        return false;
      });
}
