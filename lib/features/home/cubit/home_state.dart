import '../services/models/category_model.dart';
import '../services/models/products_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesSuccess extends HomeState {
  final List<CategoryModel> categories;

  CategoriesSuccess({required this.categories});
}

class CategoriesFailure extends HomeState {
  final String errorMessage;

  CategoriesFailure({required this.errorMessage});
}

class ProductsLoading extends HomeState {}

class ProductsSuccess extends HomeState {
  final List<ProductModel> products;

  ProductsSuccess({required this.products});
}

class ProductsFailure extends HomeState {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}
