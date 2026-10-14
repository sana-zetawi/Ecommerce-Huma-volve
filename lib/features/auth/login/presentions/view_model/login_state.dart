import '../../domain/entity/login_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final List<LoginEntity> loginEntity;

  LoginSuccess({required this.loginEntity});
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}
