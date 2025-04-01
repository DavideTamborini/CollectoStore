import 'package:collecto_data/src/models/models.dart';

abstract class ProductApi {
  Future<List<Product>> getItems({
    required int pageNumber,
    required int pageSize,
  });
}
