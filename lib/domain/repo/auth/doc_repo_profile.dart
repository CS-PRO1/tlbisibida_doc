import 'dart:typed_data';

import 'package:tlbisibida_doc/data/models/profile/db_dentist.dart';

abstract class DocRepoProfile {
  DBProfileResponse? dbDentistProfile;

  Future<bool> postimg(String image);
  Future<void> getDocProfile();
  Future<Uint8List>? getProfilePic();
}
