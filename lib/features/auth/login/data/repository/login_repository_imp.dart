import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';


import '../../../../../core/error/error_handlinig.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repository/login_repository.dart';
import '../data_source/login_remote_data_source.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImp(this.loginRemoteDataSource);

  @override
  Future<Either<Failure, List<LoginEntity>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result =await  loginRemoteDataSource.login(email: email, password: password);

      return Right(result as List<LoginEntity>);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }

  }

  
}