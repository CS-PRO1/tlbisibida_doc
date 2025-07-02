import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo_emails.dart';

class EmailsCubit extends Cubit<String> {
  final DocRepoEmails repo;

  EmailsCubit(this.repo) : super('');

  //Check Verification Code
  bool auth = false;
  Future<void> checkVerificationCode(
      String guard, String email, int verificationCode) async {
    emit('checking');
    try {
      auth =
          await repo.postCheckVerificationCode(guard, email, verificationCode);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('checked') : emit('error');
    print(state);
  }

  //forget pass
  Future<void> forgetpass(
      String guard, String email, String newpass, String newpassconfirm) async {
    emit('checking');
    try {
      auth = await repo.postForgetPass(guard, email, newpass, newpassconfirm);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('checked') : emit('error');
    print(state);
  }

  //stage emp
  Future<void> stageemp(
      String guard, String email, int verificationCode) async {
    emit('checking');
    try {
      auth = await repo.postStageEmp(guard, email, verificationCode);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('checked') : emit('error');
    print(state);
  }
}
