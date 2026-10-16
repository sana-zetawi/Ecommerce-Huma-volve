import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../entity/details_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails({
    required int id
  });
}
