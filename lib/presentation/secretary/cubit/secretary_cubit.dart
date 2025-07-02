import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo.dart';

class AuthCubit extends Cubit<String> {
  final DocRepo repo;

  AuthCubit(this.repo) : super('');

  //Login
  bool auth = false;
  Future<void> login(String email, String password) async {
    emit('logging_in');
    try {
      auth = await repo.login(email, password);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('logged_in') : emit('error');
    print(state);
  }
}
