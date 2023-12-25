part of 'auth_cubit.dart';

abstract class AuthState {
  @override
  String toString() {
    if (this is AuthErrorState) {
      return "AuthErrorState";
    } else if (this is AuthLoadingState) {
      return "AuthLoadingState";
    } else if (this is AuthSuccessState) {
      return "AuthSuccessState";
    } else if (this is AuthForgetPasswordSuccessState) {
      return "AuthForgetPasswordSuccessState";
    } else {
      return "AuthInitialState";
    }
  }
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
}

class AuthSuccessState extends AuthState {
  final DomainUser domainUser;

  AuthSuccessState(this.domainUser);
}

class AuthForgetPasswordSuccessState extends AuthState {}
