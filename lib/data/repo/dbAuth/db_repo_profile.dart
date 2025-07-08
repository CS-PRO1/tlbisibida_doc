import 'dart:typed_data';

import 'package:tlbisibida_doc/data/models/profile/db_dentist.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_profile.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbRepoProfile implements DocRepoProfile {
  @override
  Future<bool> postimg(String image) async =>
      await DioHelper.postData('dentist/edit-profile-image', {'image': image},
              token: CacheHelper.get('token'))
          .then((value) {
        if (value != null && value.data['status']) {
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

  DBDentistProfile? dbDentistProfile;
  @override
  Future<void> getDocProfile() async {
    return await DioHelper.getData('auth/profile',
            token: CacheHelper.get('token'))
        .then((value) {
      dbDentistProfile = DBDentistProfile.fromJson(value?.data);
    }).catchError((error) {
      print('error in getDocGainsStatistics: ' + error.toString());
    });
  }

    Future<Uint8List>? getProfilePic() async =>
      await DioHelper.getImage('dentist/download-profile-image',
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

}
