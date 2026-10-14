import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../entity/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, List<LoginEntity>>> login({
    required String email,
    required String password,
  });
}
