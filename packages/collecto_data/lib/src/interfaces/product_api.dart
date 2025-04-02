import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_data/src/interfaces/generic_api.dart';

abstract class ProductApi implements IApi<Product> {
  Future<List<String>> getCategories();

  Future<List<Product>> getCategoryItems({
    required String categoryName,
    required int pageNumber,
    required int pageSize,
    SortType sortBy = SortType.asc,
  });
}
