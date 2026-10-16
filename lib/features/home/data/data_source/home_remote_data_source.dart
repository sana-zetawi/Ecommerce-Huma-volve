import '../models/category_model.dart';
import '../models/products_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProduct(
    int? categoryId, {
    required int offset,
    required int limit,
  });
  Future<List<CategoryModel>> getCategories();
}
