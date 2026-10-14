import '../../domain/entity/home_category_entity.dart';

class CategoryModel extends HomeCategoryEntity {
  


  CategoryModel(
      {super.id,
      super.name,
   });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
