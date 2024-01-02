import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/core/network/network_info.dart';
import 'package:store_ify/features/stores/data/models/stores_model.dart';
import 'package:store_ify/features/stores/data/repositories/stores_repo.dart';

class StoresRepoImpl implements StoresRepo {
  final DioConsumer dioConsumer;
  final NetworkInfo networkInfo;

  const StoresRepoImpl({
    required this.dioConsumer,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<StoresModel>>> getStores(
      {String? storeType}) async {
    try {
      final response = await dioConsumer.getData(
        '${EndPoints.store}?type=$storeType',
      );

      List<StoresModel> stores = [];
      for (var item in response["Store"]) {
        stores.add(StoresModel.fromJson(item));
      }

      return right(stores);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
