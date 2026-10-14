import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase)
    : super(LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUseCase.invoke(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.failureMessage)),
      (loginEntity) => emit(LoginSuccess(loginEntity: loginEntity)),
    );
  }
}

