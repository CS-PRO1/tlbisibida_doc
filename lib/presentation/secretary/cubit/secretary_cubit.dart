import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/secretary/secretaries.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo.dart';
import 'package:tlbisibida_doc/presentation/secretary/cubit/secretary_states.dart';

class SecCubit extends Cubit<SecretaryState> {
  final DocRepo repo;

  SecCubit(this.repo) : super(SecretaryInitial());

  List<Secretary> sec = [];

  Future<void> getsec() async {
    emit(SecretaryLoading());
    sec.clear();
    try {
      await repo.getSecretaries();
      for (var secretary in repo.dbSecretariesResponse!.secretaries!) {
        sec.add(secretary.toDomain());
      }
      emit(SecretaryLoaded(sec));
    } catch (e, stack) {
      emit(SecretaryError(e.toString(), stackTrace: stack));
    }
  }

  Future<void> updatesec(int id, String firstName, String lastName,
      String phone, String email, String attendenceTime, String address) async {
    emit(SecretaryUpdating());
    try {
      final auth = await repo.updateSecretary(
          id, firstName, lastName, phone, email, attendenceTime, address);
      if (auth) {
        emit(SecretaryUpdated());
        await getsec();
      } else {
        emit(SecretaryError('Failed to update secretary.'));
      }
    } catch (e, stack) {
      emit(SecretaryError(e.toString(), stackTrace: stack));
    }
  }

  Future<void> addsec(String firstName, String lastName, String phone,
      String email, String attendenceTime, String address) async {
    emit(SecretaryAdding());
    try {
      final auth = await repo.postAddSecretary(
          firstName, lastName, phone, email, attendenceTime, address);
      if (auth) {
        emit(SecretaryAdded());
        await getsec();
      } else {
        emit(SecretaryError('Failed to add secretary.'));
      }
    } catch (e, stack) {
      emit(SecretaryError(e.toString(), stackTrace: stack));
    }
  }

  Future<void> delsec(int id) async {
    emit(SecretaryDeleting());
    try {
      final auth = await repo.delSecretary(id);
      if (auth) {
        emit(SecretaryDeleted());
        await getsec();
      } else {
        emit(SecretaryError('Failed to delete secretary.'));
      }
    } catch (e, stack) {
      emit(SecretaryError(e.toString(), stackTrace: stack));
    }
  }
}
