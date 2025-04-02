import 'package:collecto_data/collecto_data.dart';

abstract interface class IApi<T> {
  Future<List<T>> getItems({
    required int pageNumber,
    required int pageSize,
    SortType sortBy = SortType.asc,
  });

  Future<T> getItem({
    required int itemId,
  });
}
