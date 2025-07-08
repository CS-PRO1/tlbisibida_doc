import 'package:tlbisibida_doc/data/models/profile/db_dentist.dart';

abstract class DocRepoProfile {
  DBDentistProfile? dbDentistProfile;

  Future<bool> postimg(String image);
  Future<void> getDocProfile();
}
