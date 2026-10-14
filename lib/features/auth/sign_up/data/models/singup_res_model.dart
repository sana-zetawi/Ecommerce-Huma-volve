
import '../../domain/entity/signup_entity.dart';

class SingupResModel extends SignupResEntity {

  SingupResModel({
    super.id,
    super.email,
    super.name,
    super.password,
    super.role,
    super.avatar,
    super.updatedAt,
    super.creationAt,
  });

  SingupResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    role = json['role'];
    avatar = json['avatar'];
    updatedAt = json['updatedAt'];
    creationAt = json['creationAt'];
  }
}
