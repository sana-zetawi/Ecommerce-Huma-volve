import 'package:dartz/dartz.dart';

import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';

import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_category_entity.dart';

import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';

import '../../../../core/error/error_handlinig.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImp(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> getCategories() async {
    try {
      final result =await  homeRemoteDataSource.getCategories();

      return Right(result as List<HomeCategoryEntity>);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }

  }

  @override
  Future<Either<Failure, List<HomeProductEntity>>> getProduct(int? categoryId) async {
     try {
      final result =await  homeRemoteDataSource.getProduct(categoryId);

      return Right(result as List<HomeProductEntity>);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
  
}