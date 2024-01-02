import 'package:equatable/equatable.dart';

class StoresModel extends Equatable {
  final String id;
  final String name;
  final int rate;
  final CategoryImage image;

  const StoresModel({
    required this.id,
    required this.name,
    required this.rate,
    required this.image,
  });
  factory StoresModel.fromJson(Map<String, dynamic> json) {
    return StoresModel(
      id: json["_id"],
      name: json["name"],
      rate: json["rate"],
      image: CategoryImage.fromJson(json["image"]),
    );
  }
  String get categoryId => id;
  @override
  List<Object?> get props => [id, name, rate, image];
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
