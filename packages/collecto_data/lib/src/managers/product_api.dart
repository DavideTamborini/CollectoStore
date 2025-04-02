import 'package:collecto_data/collecto_data.dart';

class ProductApiManager extends ProductApi {
  ProductApiManager(this._dio);

  final Dio _dio;

  @override
  Future<List<Product>> getItems({
    required int pageNumber,
    required int pageSize,
    SortType sortBy = SortType.asc,
  }) async {
    final request = await _dio.get<List<dynamic>>(
      '${_dio.options.baseUrl}/products',
      queryParameters: {
        'sort': sortBy.name,
      },
    );
    switch (request.statusCode) {
      case 200:
        return request.data!
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      default:
        throw ProductException(
          statusCode: request.statusCode,
          statusMessage: request.statusMessage,
        );
    }
  }

  @override
  Future<Product> getItem({
    required int itemId,
  }) async {
    final request = await _dio.get<Map<String, dynamic>>(
      '${_dio.options.baseUrl}/products/$itemId',
    );
    switch (request.statusCode) {
      case 200:
        return Product.fromJson(request.data!);
      default:
        throw ProductException(
          statusCode: request.statusCode,
          statusMessage: request.statusMessage,
        );
    }
  }

  @override
  Future<List<Product>> getCategoryItems({
    required String categoryName,
    required int pageNumber,
    required int pageSize,
    SortType sortBy = SortType.asc,
  }) async {
    final request = await _dio.get<List<dynamic>>(
      '${_dio.options.baseUrl}/products/category/$categoryName',
      queryParameters: {
        'sort': sortBy.name,
      },
    );
    switch (request.statusCode) {
      case 200:
        return request.data!
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      default:
        throw ProductException(
          statusCode: request.statusCode,
          statusMessage: request.statusMessage,
        );
    }
  }

  @override
  Future<List<String>> getCategories() async {
    final request = await _dio.get<List<dynamic>>(
      '${_dio.options.baseUrl}/products/categories',
    );
    switch (request.statusCode) {
      case 200:
        return request.data!.map((item) => item as String).toList();
      default:
        throw ProductException(
          statusCode: request.statusCode,
          statusMessage: request.statusMessage,
        );
    }
  }
}
