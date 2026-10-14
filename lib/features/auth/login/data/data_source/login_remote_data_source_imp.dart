import '../../../../../core/constants/api_endpoints.dart';
import '../../../../../core/networks/api_clints.dart';

import '../../../../../core/storage/secure_storage.dart';
import '../models/login_model.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  ApiClints apiClints;
  LoginRemoteDataSourceImp(this.apiClints);

   @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClints.dio.post(
      ApiEndpoints.loginEndpoint,
      data: {'email': email, 'password': password},
    );
    final Map<String, dynamic> jsonDate = response.data;
    final modelData = LoginModel.fromJson(jsonDate);
    await SecureStorage.saveAccessToken(modelData.accessToken!);
    await SecureStorage.saveRefreshToken(modelData.refreshToken!);
    return modelData;
  }
}