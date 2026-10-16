import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/home_product_entity.dart';
import '../../domain/use_cases/get_category_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoryUseCase getCategoryUseCase;
  final GetProductsUseCase getProductsUseCase;
  final int limit = 10;
  int offset = 0;
  bool loadingMore = false;
  bool hasMore = true;
  List<HomeProductEntity> _products = [];
  int? selectedCategoryId; // Number of products to fetch per request
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
        categoryId = categories[0].id ?? 0;
        emit(CategoriesSuccess(categories: categories));
        await loadProductsByCategoryId(categoryId);
      },
    );
  }

  Future<void> loadProductsByCategoryId(int? categoryId) async {
    _products.clear();
    hasMore = true;
    offset = 0;
    emit(ProductsLoading());
    final productsResult = await getProductsUseCase.invoke(
      categoryId,
      offset: offset,
      limit: limit,
    );
    productsResult.fold(
      (failure) => emit(ProductsFailure(errorMessage: failure.failureMessage)),
      (products) {
         selectedCategoryId = categoryId;
        _products.addAll(products);
        offset = products.length;
        if (products.length < limit) {
          hasMore = false;
        }
        emit(ProductsSuccess(products: _products));
      },
    );
  }
  Future<void> loadMoreProducts() async {
    if(loadingMore || !hasMore) return;
    loadingMore = true;
    emit(ProductsLoadingMore());
    final productsResult = await getProductsUseCase.invoke(
      selectedCategoryId,
      offset: offset,
      limit: limit,
    );
    productsResult.fold(
      (failure) => emit(ProductsLoadingFailure(errorMessage: failure.failureMessage)),
      (newProducts) {
        _products.addAll(newProducts);
        offset += newProducts.length;
        if (newProducts.length < limit) {
          hasMore = false;
        }
        emit(ProductsSuccess(products: _products));
      },
    );
  }
}
