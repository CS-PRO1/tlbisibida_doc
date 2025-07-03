import 'package:get_it/get_it.dart';
import 'package:tlbisibida_doc/data/repo/dbAuth/db_repo_auth.dart';
import 'package:tlbisibida_doc/data/repo/dbAuth/db_repo_profile.dart';
import 'package:tlbisibida_doc/data/repo/dbEmails/db_repo_emails.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => DbRepoAuth());
  locator.registerLazySingleton(() => DbRepoProfile());
  locator.registerLazySingleton(() => DbRepoEmails());
}
