import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_repos/src/interfaces/generic_interfaces.dart';
import 'package:dartz/dartz.dart';

class ProductRepository implements IGenericRepo<Product> {
  ProductRepository({
    required ProductApi productApi,
  }) : _apiManager = productApi;

  final ProductApi _apiManager;

  @override
  Future<Either<List<Product>, ProductException>> getItems({
    required int pageNumber,
    required int pageSize,
    SortType sortBy = SortType.asc,
  }) async {
    try {
      final apiRequest = await _apiManager.getItems(
        pageNumber: pageNumber,
        pageSize: pageSize,
        sortBy: sortBy,
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

  @override
  Future<Either<Product, ProductException>> getItem({
    required int itemId,
  }) async {
    try {
      final apiRequest = await _apiManager.getItem(itemId: itemId);
      return Left(apiRequest);
    } on Exception catch (e) {
      return Right(
        e is ProductException
            ? e
            : ProductException(statusMessage: e.toString()),
      );
    }
  }

  Future<Either<List<String>, ProductException>> getCategories({
    required int itemId,
  }) async {
    try {
      final apiRequest = await _apiManager.getCategories();
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
