import '../../../../../core/constants/api_endpoints.dart';
import '../../../../../core/networks/api_clints.dart';

import '../models/singup_req_model.dart';
import '../models/singup_res_model.dart';
import 'signup_remote_data_source.dart';

class SingupRemoteDataSourceImp implements SingupRemoteDataSource {
  ApiClints apiClints;
  SingupRemoteDataSourceImp(this.apiClints);

   @override
  Future<SingupResModel> signup({required SingupReqModel signup}) async {
    final response = await apiClints.dio.post(
      ApiEndpoints.singupEndpoint,
      data: {
        'name': signup.name,
        'email': signup.email,
        'password': signup.password,
        'avatar': 'https://picsum.photos/640/480',
      },
    );
    final Map<String, dynamic> jsonDate = response.data;
    final modelData = SingupResModel.fromJson(jsonDate);
    return modelData;
  }
}