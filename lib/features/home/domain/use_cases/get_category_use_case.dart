import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/home_category_entity.dart';
import '../repository/home_repository.dart';

class GetCategoryUseCase {
  final HomeRepository homeRepository;

  GetCategoryUseCase({required this.homeRepository});

  Future<Either<Failure, List<HomeCategoryEntity>>> invoke() => homeRepository.getCategories();
  
}