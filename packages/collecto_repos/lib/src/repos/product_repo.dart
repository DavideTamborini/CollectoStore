import 'package:collecto_data/collecto_data.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  ProductRepository({
    required ProductApi productApi,
  }) : _apiManager = productApi;

  final ProductApi _apiManager;

  Future<Either<List<Product>, ProductException>> getItems({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final apiRequest = await _apiManager.getItems(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return Left(apiRequest);
    } on Exception catch (e) {
      return Right(
        e is ProductException
            ? e
            : ProductException(statusMessage: e.toString()),
      );
    }
  }
}
