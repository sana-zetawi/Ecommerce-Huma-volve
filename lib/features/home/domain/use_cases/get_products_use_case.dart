import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/home_product_entity.dart';
import '../repository/home_repository.dart';

class GetProductsUseCase {
  final HomeRepository homeRepository;

  GetProductsUseCase({required this.homeRepository});

  Future<Either<Failure, List<HomeProductEntity>>> invoke(  int? categoryId, {
    required int offset,
    required int limit,
  }) =>
      homeRepository.getProduct(categoryId, offset: offset, limit: limit);
}
