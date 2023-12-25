import 'package:coptix/domain/model/auth_request_params.dart';
import 'package:coptix/domain/model/domain_user.dart';
import 'package:coptix/domain/usecase/foreget_password_usecase.dart';
import 'package:coptix/domain/usecase/login_usecase.dart';
import 'package:coptix/domain/usecase/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/error_handling/failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  late Function(DomainUser) successHandler;
  late Function(bool) forgetPasswordSuccessHandler;
  late Function(Failure) errorHandler;

  AuthCubit(this.loginUseCase, this.signupUseCase, this.forgetPasswordUseCase)
      : super(AuthInitialState()) {
    initCategoriesStateHandlers();
  }

  void initCategoriesStateHandlers() {
    errorHandler = (error) {
      emit(AuthErrorState(error.message));
    };

    successHandler = (DomainUser domainUser) {
      emit(AuthSuccessState(domainUser));
    };
    forgetPasswordSuccessHandler = (_) {
      emit(AuthForgetPasswordSuccessState());
    };
  }

  void login(String email, String password) {
    emit(AuthLoadingState());
    AuthRequest authRequest = AuthRequest(email: email, password: password);
    loginUseCase.execute(authRequest).then((response) {
      return response.fold(errorHandler, successHandler);
    });
  }

  void signup(
      {required String name,
      required String email,
      required String mobile,
      required String password}) {
    emit(AuthLoadingState());
    AuthRequest authRequest = AuthRequest(
        name: name, email: email, mobile: mobile, password: password);
    signupUseCase.execute(authRequest).then((response) {
      return response.fold(errorHandler, successHandler);
    });
  }

  void forgetPassword(String email) {
    emit(AuthLoadingState());
    AuthRequest authRequest = AuthRequest(email: email);
    forgetPasswordUseCase.execute(authRequest).then((response) {
      return response.fold(errorHandler, forgetPasswordSuccessHandler);
    });
  }
}
