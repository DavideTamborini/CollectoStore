import 'package:collecto_data/collecto_data.dart';
import 'package:dartz/dartz.dart';

abstract interface class IGenericRepo<T> {
  Future<Either<List<T>, Exception>> getItems({
    required int pageNumber,
    required int pageSize,
    SortType sortBy = SortType.asc,
  });

  Future<Either<T, Exception>> getItem({
    required int itemId,
  });
}
