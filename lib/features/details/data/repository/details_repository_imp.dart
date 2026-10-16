import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';


import '../../../../../core/error/error_handlinig.dart';
import '../../domain/entity/details_entity.dart';
import '../../domain/repository/details_repository.dart';
import '../data_source/details_remote_data_source.dart';

class ProductDetailsRepositoryImp implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;
  ProductDetailsRepositoryImp(this.productDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails({
    required int id
  }) async {
    try {
      final result = await productDetailsRemoteDataSource.getProductDetails(id: id);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
