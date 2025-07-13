import 'package:tlbisibida_doc/domain/models/secretary/secretaries.dart';

abstract class SecretaryState {
  const SecretaryState();
}

class SecretaryInitial extends SecretaryState {}

class SecretaryLoading extends SecretaryState {}

class SecretaryLoaded extends SecretaryState {
  final List<Secretary> secretaries;
  const SecretaryLoaded(this.secretaries);
}

class SecretaryError extends SecretaryState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const SecretaryError(this.message, {this.errorCode, this.stackTrace});
}

class SecretaryUpdating extends SecretaryState {}

class SecretaryUpdated extends SecretaryState {}

class SecretaryAdding extends SecretaryState {}

class SecretaryAdded extends SecretaryState {}

class SecretaryDeleting extends SecretaryState {}

class SecretaryDeleted extends SecretaryState {}
