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

class AuthCubit extends Cubit<String> {
  final DocRepoAuth repo;

  AuthCubit(this.repo) : super('');

  //Login
  bool auth = false;
  Future<void> login(String email, String password, String guard) async {
    emit('logging_in');
    try {
      auth = await repo.postlogin(email, password, guard);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('logged_in') : emit('error');
    print(state);
  }

  //Logout
  Future<void> logout() async {
    emit('logging_out');
    try {
      auth = await repo.postlogout();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('logged_out') : emit('error');
    print(state);
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
    register();
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
    emit('registering');
    try {
      auth = await repo.postregister(registrydata);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('regestered') : emit('error');
    print(state);
  }
}
