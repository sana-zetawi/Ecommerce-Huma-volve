import '../../domain/entity/signup_entity.dart';

abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final List<SignupResEntity> signupEntity;

  SignupSuccess({required this.signupEntity});
}

class SignupFailure extends SignupState {
  final String errorMessage;

  SignupFailure({required this.errorMessage});
}
