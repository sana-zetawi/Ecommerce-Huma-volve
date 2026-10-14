import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/networks/api_clints.dart';
import '../models/category_model.dart';
import '../models/products_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiClints apiClints;
  HomeRemoteDataSourceImp(this.apiClints);
  @override
 Future<List<ProductModel>> getProduct(int? categoryId) async {
    final response = await apiClints.dio.get(
      "${ApiEndpoints.categoriesEndpoint}/$categoryId/${ApiEndpoints.productsEndpoint}",
    );
    final List<dynamic> jsonDate = response.data;
    final List<ProductModel> modelData = jsonDate.map((e) => ProductModel.fromJson(e)).toList();
    return modelData;
  }

  @override
 Future<List<CategoryModel>> getCategories() async {
      final response = await apiClints.dio.get(
      ApiEndpoints.categoriesEndpoint,
    );
    final List<dynamic> jsonDate = response.data;
    final List<CategoryModel> modelData = jsonDate.map((e) => CategoryModel.fromJson(e)).toList();
    return modelData;
  }
}