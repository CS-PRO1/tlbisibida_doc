abstract class EmailsState {
  const EmailsState();
}

class EmailsInitial extends EmailsState {}

class EmailsChecking extends EmailsState {}

class EmailsChecked extends EmailsState {}

class EmailsError extends EmailsState {
  final String message;
  final StackTrace? stackTrace;
  const EmailsError(this.message, {this.stackTrace});
}
