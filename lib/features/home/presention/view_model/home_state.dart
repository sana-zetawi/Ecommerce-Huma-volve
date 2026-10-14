import '../../domain/entity/home_category_entity.dart';
import '../../domain/entity/home_product_entity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<HomeCategoryEntity> categories;

  CategoriesSuccess({required this.categories});
}

class CategoriesFailure extends HomeState {
  final String errorMessage;

  CategoriesFailure({required this.errorMessage});
}

class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  final List<HomeProductEntity> products;

  ProductsSuccess({required this.products});
}

class ProductsFailure extends HomeState {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}
