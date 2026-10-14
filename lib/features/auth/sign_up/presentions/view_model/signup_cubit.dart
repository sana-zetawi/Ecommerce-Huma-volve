import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/singup_req_model.dart';
import '../../domain/use_cases/signup_use_case.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  SignupCubit(this.signupUseCase) : super(SignupInitialState());

  Future<void> signup({required SingupReqModel signup}) async {
    emit(SignupLoading());
    final result = await signupUseCase.invoke(signup: signup);
    result.fold(
      (failure) => emit(SignupFailure(errorMessage: failure.failureMessage)),
      (signupEntity) => emit(SignupSuccess(signupEntity: signupEntity)),
    );
  }
}