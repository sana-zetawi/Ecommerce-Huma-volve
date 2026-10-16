import '../../../../../core/constants/api_endpoints.dart';
import '../../../../../core/networks/api_clints.dart';

import '../models/details_model.dart';
import 'details_remote_data_source.dart';

class ProductDetailsRemoteDataSourceImp implements ProductDetailsRemoteDataSource {
  ApiClints apiClints;
  ProductDetailsRemoteDataSourceImp(this.apiClints);

   @override
  Future<  ProductDetailsModel> getProductDetails({
    required int id
  }) async {
    final response = await apiClints.dio.post(
      ApiEndpoints.productsEndpoint,
      data: {'id': id},
    );
    final Map<String, dynamic> jsonDate = response.data;
    final modelData = ProductDetailsModel.fromJson(jsonDate);
    return modelData;
  }
}