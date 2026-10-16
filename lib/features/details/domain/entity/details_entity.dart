import '../../../home/data/models/category_model.dart';

class ProductDetailsEntity {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  CategoryModel? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  ProductDetailsEntity({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });
}
