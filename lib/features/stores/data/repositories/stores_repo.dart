import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';
import 'package:store_ify/features/stores/data/models/stores_model.dart';

abstract class StoresRepo {
  Future<Either<Failure, List<StoresModel>>> getStores({String? storeType});
}
