import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/core/network/network_info.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';
import 'package:store_ify/features/categories/data/repositories/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final DioConsumer dioConsumer;
  final NetworkInfo networkInfo;

  const CategoryRepoImpl({
    required this.dioConsumer,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoriesModel>>> getCategories() async {
    try {
      final response = await dioConsumer.get(
        EndPoints.category,
      );

      List<CategoriesModel> categories = [];
      for (var item in response["category"]) {
        categories.add(CategoriesModel.fromJson(item));
      }

      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
