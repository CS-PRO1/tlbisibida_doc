// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_auth.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbRepoAuth implements DocRepoAuth {
  @override
  Future<bool> postlogin(String email, String password, String guard) async =>
      await DioHelper.postData('login', {
        'email': email,
        'password': password,
        'guard': 'dentist'
      }).then((value) {
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
  Future<bool> postlogout() async =>
      await DioHelper.postData('auth/logout', {}).then((value) {
        if (value != null && value.data['status']) {
          CacheHelper.removeString('token');
          print("Logout successful. Token: ${CacheHelper.get('token')}");
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
  Future<bool> postrefreshtoken() {
    // TODO: implement postrefreshtoken
    throw UnimplementedError();
  }

  // final Map<String, dynamic> data = {
  //   'guard': guard,
  //   'first_name': firstName,
  //   'last_name': lastName,
  //   'email': email,
  //   'password': password,
  //   'password_confirmation': passwordConfirmation,
  //   'phone': phone,
  //   'address': address,
  //   ...workingHours, // Spread the working hours map directly into the data
  //   'register_subscription_duration': subscriptionDuration,
  // };
  @override
  Future<bool> postregister(Map<String, dynamic> data) async =>
      await DioHelper.postData('register', data).then((value) {
        if (value != null && value.data['status']) {
          CacheHelper.setString(
              'token', 'Bearer ' + value.data['data']['access_token']);
          print("Register successful. Token: ${CacheHelper.get('token')}");
          return true;
        } else {
          print(
              "Register failed: ${value?.data['message'] ?? 'Unknown error'}");
          return false;
        }
      }).catchError((error) {
        print(error.toString());
        return false;
      });
}
