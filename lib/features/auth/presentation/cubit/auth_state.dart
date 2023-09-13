class AuthState {}

final class AuthInitial extends AuthState {}

final class IconChangedState extends AuthState {}

final class ItemCahngedState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final String message;

  LoginSuccessState(this.message);
}

final class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState(this.message);
}

final class LoginLoadingState extends AuthState {}

final class SendCodeSuccessState extends AuthState {
  final String message;

  SendCodeSuccessState(this.message);
}

final class SendCodeErrorState extends AuthState {
  final String message;

  SendCodeErrorState(this.message);
}

final class SendCodeLoadingState extends AuthState {}

final class SignUpSuccesState extends AuthState {
  final String message;

  SignUpSuccesState(this.message);
}

final class SignUpErrorState extends AuthState {
  final String message;

  SignUpErrorState(this.message);
}

final class SignUpLoadingState extends AuthState {}
