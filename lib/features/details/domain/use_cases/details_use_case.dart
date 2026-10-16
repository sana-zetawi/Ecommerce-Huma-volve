import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../entity/details_entity.dart';
import '../repository/details_repository.dart';

class ProductDetailsUseCase {
  final ProductDetailsRepository productDetailsRepository;

  ProductDetailsUseCase({required this.productDetailsRepository});

  Future<Either<Failure, ProductDetailsEntity>> invoke({
    required int id
  }) =>
      productDetailsRepository.getProductDetails(id: id);
}
