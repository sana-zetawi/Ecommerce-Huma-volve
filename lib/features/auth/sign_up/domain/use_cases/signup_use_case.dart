import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../data/models/singup_req_model.dart';
import '../entity/signup_entity.dart';
import '../repository/signup_repository.dart';

class SignupUseCase {
  final SignupResRepository signupRepository;

  SignupUseCase({required this.signupRepository});

  Future<Either<Failure, List<SignupResEntity>>> invoke({
    required SingupReqModel signup
  }) =>
      signupRepository.signup(signup: signup);

}