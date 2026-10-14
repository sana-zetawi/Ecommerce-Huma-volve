import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_category_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoryUseCase getCategoryUseCase;
  final GetProductsUseCase getProductsUseCase;
  HomeCubit(this.getCategoryUseCase, this.getProductsUseCase)
    : super(HomeInitialState());

  Future<void> loadDate() async {
    int categoryId = 0;
    emit(CategoriesLoading());
    final categoriesResult = await getCategoryUseCase.invoke();
    categoriesResult.fold(
      (failure) =>
          emit(CategoriesFailure(errorMessage: failure.failureMessage)),
      (categories) async {
        categoryId =  categories[0].id ?? 0;
        emit(CategoriesSuccess(categories: categories));
        final productsResult = await getProductsUseCase.invoke(categoryId);
        productsResult.fold(
          (failure) =>
              emit(ProductsFailure(errorMessage: failure.failureMessage)),
          (products) => emit(ProductsSuccess(products: products)),
        );
      },
    );
  }

  Future<void> loadProductsByCategoryId(int? categoryId) async {
    emit(ProductsLoading());
    final productsResult = await getProductsUseCase.invoke(categoryId);
    productsResult.fold(
      (failure) => emit(ProductsFailure(errorMessage: failure.failureMessage)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
