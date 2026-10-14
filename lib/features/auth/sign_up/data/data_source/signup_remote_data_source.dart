import '../models/singup_req_model.dart';
import '../models/singup_res_model.dart';

abstract class SingupRemoteDataSource {

  Future<SingupResModel> signup({
    required SingupReqModel signup,
  });
}