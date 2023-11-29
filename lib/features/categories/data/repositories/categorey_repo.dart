import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';

abstract class CategoreyRepo {
  Future<Either<Failure, List<CategoriesModel>>> getCategories();
}
