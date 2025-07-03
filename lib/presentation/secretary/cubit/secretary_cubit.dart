import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/secretary/secretaries.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo.dart';

class SecCubit extends Cubit<String> {
  final DocRepo repo;

  SecCubit(this.repo) : super('');

  //get sec
  bool auth = false;
  List<Secretary> sec = [];
  Future<void> getsec() async {
    emit('get sec');
    try {
      await repo.getSecretaries();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    for (var secretary in repo.dbSecretariesResponse!.secretaries!) {
      sec.add(secretary.toDomain());
    }
    auth ? emit('got sec') : emit('error');
    print(state);
  }

  //update  sec

  Future<void> updatesec(int id, String firstName, String lastName,
      String phone, String email, String attendenceTime, String address) async {
    emit('updating');
    try {
      auth = await repo.updateSecretary(
          id, firstName, lastName, phone, email, attendenceTime, address);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('updated') : emit('error');
    print(state);
  }
  //add  sec

  Future<void> addsec(String firstName, String lastName, String phone,
      String email, String attendenceTime, String address) async {
    emit('adding');
    try {
      auth = await repo.postAddSecretary(
          firstName, lastName, phone, email, attendenceTime, address);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('added') : emit('error');
    print(state);
  }
  //delete  sec

  Future<void> delsec(int id) async {
    emit('deleting');
    try {
      auth = await repo.delSecretary(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    auth ? emit('deleted') : emit('error');
    print(state);
  }
}
