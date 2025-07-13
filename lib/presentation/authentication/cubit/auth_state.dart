
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {}

class AuthLoggedOut extends AuthState {}

class AuthRegistered extends AuthState {}

class AuthError extends AuthState {
  final String message;
  final StackTrace? stackTrace;
  const AuthError(this.message, {this.stackTrace});
}
