import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/home_category_entity.dart';
import '../entity/home_product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategories();
  Future<Either<Failure, List<HomeProductEntity>>> getProduct(int? categoryId);

}