import 'package:equatable/equatable.dart';

class StoresModel extends Equatable {
  final String id;
  final String name;
  final CategoryImage image;
  final double rate;
  final String type;

  const StoresModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.type,
  });
  factory StoresModel.fromJson(Map<String, dynamic> json) {
    return StoresModel(
        id: json["_id"],
        name: json["name"],
        image: CategoryImage.fromJson(json["image"]),
        rate: (json['rate'] ?? 0).toDouble(),
        type: json['type']);
  }
  String get categoryId => id;
  @override
  List<Object?> get props => [id, name, image, rate, type];
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
