import 'package:tlbisibida_doc/data/models/profile/db_dentist.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo_profile.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';

class DbRepoProfile implements DocRepoProfile {
  @override
  Future<bool> postimg(String image) async =>
      await DioHelper.postData('dentist/edit-profile-image', {'image': image})
          .then((value) {
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

  DBDentistProfile? dbDentistProfile;
  @override
  Future<void> getDocProfile() async {
    return await DioHelper.getData('auth/profile', token: '').then((value) {
      dbDentistProfile = DBDentistProfile.fromJson(value?.data);
    }).catchError((error) {
      print('error in getDocGainsStatistics: ' + error.toString());
    });
  }
}
