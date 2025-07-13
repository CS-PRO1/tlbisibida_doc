//register
//   final Map<String, dynamic> data = {
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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_auth.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final DocRepoAuth repo;

  AuthCubit(this.repo) : super(AuthInitial());

  //Login
  bool auth = false;
  Future<void> login(String email, String password, String guard) async {
    emit(AuthLoading());
    try {
      auth = await repo.postlogin(email, password, guard);
      if (auth) {
        emit(AuthLoggedIn());
      } else {
        emit(const AuthError(
            'لم يتم تسجيل الدخول ـ تأكد من المعلومات المدخلة ثم حاول مرة أخرى'));
      }
    } catch (e, stack) {
      emit(AuthError('حدث خطأ أثناء تسجيل الدخول', stackTrace: stack));
    }
  }

  //Logout
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      auth = await repo.postlogout();
      if (auth) {
        emit(AuthLoggedOut());
      } else {
        emit(const AuthError('حدث خطأ أثناء تسجيل الخروج'));
      }
    } catch (e, stack) {
      emit(AuthError('حدث خطأ أثناء تسجيل الخروج', stackTrace: stack));
    }
  }

  Map<String, dynamic> registrydata = {};

  void cookregistry({
    required String guard,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String address,
  }) {
    registrydata = {
      'guard': guard,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'address': address,
    };
  }

  void cookregistry2({
    required Map<String, String> workingHours,
    required int subscriptionDuration,
  }) {
    registrydata = {
      ...workingHours, // Spread the working hours map directly into the data
      'register_subscription_duration': subscriptionDuration,
    };
    register();
  }

  //Register
  Future<void> register() async {
    emit(AuthLoading());
    try {
      auth = await repo.postregister(registrydata);
      if (auth) {
        emit(AuthRegistered());
      } else {
        emit(const AuthError('تأكد من المعلومات المدخلة ثم حاول مرة أخرى'));
      }
    } catch (e, stack) {
      emit(AuthError('حدث خطأ أثناء إنشاء الحساب', stackTrace: stack));
    }
  }
}
