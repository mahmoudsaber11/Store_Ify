import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final CategoreyImage image;

  const CategoriesModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      image: CategoreyImage.fromJson(json["image"]),
    );
  }
  @override
  List<Object?> get props => [id, name, description, image];
}

class CategoreyImage extends Equatable {
  final String secureUrl;
  final String publicId;

  const CategoreyImage({required this.secureUrl, required this.publicId});

  factory CategoreyImage.fromJson(Map<String, dynamic> json) {
    return CategoreyImage(
      secureUrl: json["secure_url"],
      publicId: json["public_id"],
    );
  }
  @override
  List<Object?> get props => [secureUrl, publicId];
}
