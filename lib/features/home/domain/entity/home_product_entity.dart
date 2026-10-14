import 'home_category_entity.dart';

class HomeProductEntity {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  HomeCategoryEntity? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  HomeProductEntity(
      {this.id,
      this.title,
      this.slug,
      this.price,
      this.description,
      this.category,
      this.images,
      this.creationAt,
      this.updatedAt});

}
