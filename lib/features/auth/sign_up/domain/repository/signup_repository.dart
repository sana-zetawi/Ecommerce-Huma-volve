import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../data/models/singup_req_model.dart';
import '../entity/signup_entity.dart';

abstract class SignupResRepository {
  Future<Either<Failure, List<SignupResEntity>>> signup({
    required SingupReqModel signup,
  });
}
