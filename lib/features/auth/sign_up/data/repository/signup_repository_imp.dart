import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';


import '../../../../../core/error/error_handlinig.dart';
import '../../domain/entity/signup_entity.dart';
import '../../domain/repository/signup_repository.dart';
import '../data_source/signup_remote_data_source.dart';
import '../models/singup_req_model.dart';

class SignupRepositoryImp implements SignupResRepository {
  final SingupRemoteDataSource signupRemoteDataSource;
  SignupRepositoryImp(this.signupRemoteDataSource);

  @override
  Future<Either<Failure, List<SignupResEntity>>> signup({
    required SingupReqModel signup,
  }) async {
    try {
      final result = await signupRemoteDataSource.signup(signup: signup);
      return Right(result as List<SignupResEntity>); 
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
   