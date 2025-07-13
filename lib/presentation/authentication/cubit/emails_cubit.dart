import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_emails.dart';
import 'emails_state.dart';

class EmailsCubit extends Cubit<EmailsState> {
  final DocRepoEmails repo;

  EmailsCubit(this.repo) : super(EmailsInitial());

  //Check Verification Code
  bool auth = false;
  Future<void> checkVerificationCode(
      String guard, String email, int verificationCode) async {
    emit(EmailsChecking());
    try {
      auth =
          await repo.postCheckVerificationCode(guard, email, verificationCode);
      if (auth) {
        emit(EmailsChecked());
      } else {
        emit(const EmailsError('رمز التحقق غير صحيح أو منتهي الصلاحية'));
      }
    } catch (e, stack) {
      emit(EmailsError('حدث خطأ أثناء التحقق من الرمز', stackTrace: stack));
    }
  }

  //forget pass
  Future<void> forgetpass(
      String guard, String email, String newpass, String newpassconfirm) async {
    emit(EmailsChecking());
    try {
      auth = await repo.postForgetPass(guard, email, newpass, newpassconfirm);
      if (auth) {
        emit(EmailsChecked());
      } else {
        emit(const EmailsError('تعذر إعادة تعيين كلمة المرور'));
      }
    } catch (e, stack) {
      emit(EmailsError('حدث خطأ أثناء إعادة تعيين كلمة المرور',
          stackTrace: stack));
    }
  }

  //stage emp
  Future<void> stageemp(
      String guard, String email, int verificationCode) async {
    emit(EmailsChecking());
    try {
      auth = await repo.postStageEmp(guard, email, verificationCode);
      if (auth) {
        emit(EmailsChecked());
      } else {
        emit(const EmailsError('تعذر تفعيل الحساب'));
      }
    } catch (e, stack) {
      emit(EmailsError('حدث خطأ أثناء تفعيل الحساب', stackTrace: stack));
    }
  }
}
