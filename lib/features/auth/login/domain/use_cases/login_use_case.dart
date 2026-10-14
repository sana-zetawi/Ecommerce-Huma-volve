import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../entity/login_entity.dart';
import '../repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failure, List<LoginEntity>>> invoke({
    required String email,
    required String password,
  }) =>
      loginRepository.login(email: email, password: password);

}