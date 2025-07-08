// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_emails.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbRepoEmails implements DocRepoEmails {
  @override
  Future<bool> postCheckVerificationCode(
          String guard, String email, int verificationCode) async =>
      await DioHelper.postData('auth/mails/check_verification_code', {
        'guard': 'dentist',
        'email': email,
        'verificationcode': verificationCode
      }).then((value) {
        if (value != null && value.data['status']) {
          CacheHelper.setString(
              'token', 'Bearer ' + value.data['data']['access_token']);
          print(
              "CheckVerificationCode successful. Token: ${CacheHelper.get('token')}");
          return true;
        } else {
          print(
              "CheckVerificationCode failed: ${value?.data['message'] ?? 'Unknown error'}");
          return false;
        }
      }).catchError((error) {
        print(error.toString());
        return false;
      });

  @override
  Future<bool> postForgetPass(String guard, String email, String newpass,
          String newpassconfirm) async =>
      await DioHelper.postData('auth/mails/forget-password', {
        'guard': 'dentist',
        'email': email,
        'newpass': newpass,
        'newpassconfirm': newpassconfirm,
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

  // @override
  // Future<bool> postVerifyEmail(
  //     String guard, String email, int verificationCode) async =>
  //     await DioHelper.postData(
  //             'auth/mails/check_verification_code', {'email': email, 'password': password, 'guard': 'admin'})
  //         .then((value) {
  //       if (value != null && value.data['status']) {
  //         CacheHelper.setString(
  //             'token', 'Bearer ' + value.data['data']['access_token']);
  //         print("Login successful. Token: ${CacheHelper.get('token')}");
  //         return true;
  //       } else {
  //         print("Login failed: ${value?.data['message'] ?? 'Unknown error'}");
  //         return false;
  //       }
  //     }).catchError((error) {
  //       print(error.toString());
  //       return false;
  //     });
  // }

  @override
  Future<bool> postStageEmp(
          String guard, String email, int verificationCode) async =>
      await DioHelper.postData('auth/stage-employee', {
        'guard': 'dentist',
        'email': email,
        'verificationcode': verificationCode
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
