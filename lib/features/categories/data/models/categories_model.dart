import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final CategoryImage image;

  const CategoriesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      image: CategoryImage.fromJson(json["image"]),
    );
  }
  String get categoryId => id;
  @override
  List<Object?> get props => [id, name, description, image];
}

class CategoryImage extends Equatable {
  final String secureUrl;
  final String publicId;

  const CategoryImage({required this.secureUrl, required this.publicId});

  factory CategoryImage.fromJson(Map<String, dynamic> json) {
    return CategoryImage(
      secureUrl: json["secure_url"],
      publicId: json["public_id"],
    );
  }

  @override
  List<Object?> get props => [secureUrl, publicId];
}
