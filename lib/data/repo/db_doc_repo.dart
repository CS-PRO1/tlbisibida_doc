// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_book_an_appointment.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_booked_appointment.dart';
import 'package:tlbisibida_doc/data/models/appointments%20&%20patients/db_show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/data/models/bills/db_show_bill_details.dart';
import 'package:tlbisibida_doc/data/models/bills/db_show_lab_bills.dart';
import 'package:tlbisibida_doc/data/models/clinic%20scheduals/db_show_clinic_times.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_mylabs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_show_unsub_labs.dart';
import 'package:tlbisibida_doc/data/models/dentist%20labs/db_unsub_lab_datails.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_patient_treatments.dart';
import 'package:tlbisibida_doc/data/models/dentist%20sessions/db_show_treatment_details.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_rare_n_repeated_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_cats.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_items_log.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_quants_for_items.dart';
import 'package:tlbisibida_doc/data/models/inventory/db_show_subcats.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_case_details.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_caseslist_from_lab.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_comments.dart';
import 'package:tlbisibida_doc/data/models/medical%20cases/db_show_labs-send%20case%20to%20lab.dart';
import 'package:tlbisibida_doc/data/models/operating%20payments/db_op_payments.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patient_payments.dart';
import 'package:tlbisibida_doc/data/models/patients%20payments/db_patients_payment_from_to.dart';
import 'package:tlbisibida_doc/data/models/profile/db_dentist.dart';
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
  DBLabDetailsResponse? dbLabDetailsResponse;
  @override
  Future<void> getAllLabDetails(int id) async {
    return await DioHelper.getData(
            'dentist/labs/show_lab_not_injoied_details/$id',
            token: '')
        .then((value) {
      dbLabDetailsResponse = DBLabDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAllLabDetails: ' + error.toString());
    });
  }

  DBAllLabsResponse? dbAllLabsResponse;
  @override
  Future<void> getAllLabs() async {
    return await DioHelper.getData(
            'dentist/labs/show_all_labs_dentist_not_injoied?page=1',
            token: '')
        .then((value) {
      dbAllLabsResponse = DBAllLabsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAllLabs: ' + error.toString());
    });
  }

  DBAppointmentsResponse? dbAppointmentsResponse;
  @override
  Future<void> getAppointments() async {
    return await DioHelper.getData(
            'dentist/patients/appointments/get-booked-appointments?date=2025-05-05',
            token: '')
        .then((value) {
      dbAppointmentsResponse = DBAppointmentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAppointments: ' + error.toString());
    });
  }

  DBAvailableSlotsResponse? dbAvailableSlotsResponse;
  @override
  Future<void> getAvailableSlots() async {
    return await DioHelper.getData(
            'dentist/patients/appointments/get-avilable-slots?date=2025-5-27&duration=30',
            token: '')
        .then((value) {
      dbAvailableSlotsResponse = DBAvailableSlotsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getAvailableSlots: ' + error.toString());
    });
  }

  DBBillDetailsResponse? dbBillDetailsResponse;
  @override
  Future<void> getBillDetails(int id) async {
    return await DioHelper.getData(
            'dentist/bills/show-bill-details-with-cases/$id',
            token: '')
        .then((value) {
      dbBillDetailsResponse = DBBillDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getBillDetails: ' + error.toString());
    });
  }

  DBCategoriesResponse? dbCategoriesResponse;
  @override
  Future<void> getCats() async {
    return await DioHelper.getData('inventory/categories', token: '')
        .then((value) {
      dbCategoriesResponse = DBCategoriesResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getCats: ' + error.toString());
    });
  }

  DBDentistScheduleResponse? dbDentistScheduleResponse;
  @override
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

  DBLabBillsResponse? dbLabBillsResponse;
  @override
  Future<void> getLabBills(int id) async {
    return await DioHelper.getData(
            'dentist/bills/show-lab-bills-descending/$id',
            token: '')
        .then((value) {
      dbLabBillsResponse = DBLabBillsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getLabBills: ' + error.toString());
    });
  }

  DBLabsResponse? dbLabsResponse;
  @override
  Future<void> getLabsListForChoice() async {
    return await DioHelper.getData(
            'dentist/labs/show_all_labs_dentist_not_injoied?page=1',
            token: '')
        .then((value) {
      dbLabsResponse = DBLabsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getLabsListForChoice: ' + error.toString());
    });
  }

  DBLabsJoinedResponse? dbLabsJoinedResponse;
  @override
  Future<void> getMyLabs() async {
    return await DioHelper.getData('dentist/labs/show_labs_dentist_injoied',
            token: '')
        .then((value) {
      dbLabsJoinedResponse = DBLabsJoinedResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getMyLabs: ' + error.toString());
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

  DBPatientDetailsResponse? dbPatientDetailsResponse;
  @override
  Future<void> getPatientDetails(int id) async {
    return await DioHelper.getData('dentist/patients/show-patient/$id',
            token: '')
        .then((value) {
      dbPatientDetailsResponse = DBPatientDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientDetails: ' + error.toString());
    });
  }

  DBPatientPaymentsResponse? dbPatientPaymentsResponse;
  @override
  Future<void> getPatientPayments(int id) async {
    return await DioHelper.getData('dentist/patients-payments/get-history/$id',
            token: '')
        .then((value) {
      dbPatientPaymentsResponse =
          DBPatientPaymentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientPayments: ' + error.toString());
    });
  }

  DBPatientsPaymentsFromToResponse? dbPatientsPaymentsFromToResponse;
  @override
  Future<void> getPatientPaymentsFromTo() async {
    return await DioHelper.getData('dentist/patients-payments/get-all-ordered',
            token: '')
        .then((value) {
      dbPatientsPaymentsFromToResponse =
          DBPatientsPaymentsFromToResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientPaymentsFromTo: ' + error.toString());
    });
  }

  DBPatientTreatmentsResponse? dbPatientTreatmentsResponse;
  @override
  Future<void> getPatientTreatment(int id) async {
    return await DioHelper.getData(
            'dentist/treatments/show-patient-treatments/$id',
            token: '')
        .then((value) {
      dbPatientTreatmentsResponse =
          DBPatientTreatmentsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getPatientTreatment: ' + error.toString());
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

  DBTreatmentDetailsResponse? dbTreatmentDetailsResponse;
  @override
  Future<void> getTreatmentDetails(int id) async {
    return await DioHelper.getData(
            'dentist/treatments/show-treatment-details/$id',
            token: '')
        .then((value) {
      dbTreatmentDetailsResponse =
          DBTreatmentDetailsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error in getTreatmentDetails: ' + error.toString());
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
