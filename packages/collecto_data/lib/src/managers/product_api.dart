import 'package:collecto_data/collecto_data.dart';
import 'package:dio/dio.dart';

class ProductApiManager extends ProductApi {
  ProductApiManager(this._dio);

  final Dio _dio;

  @override
  Future<List<Product>> getItems({
    required int pageNumber,
    required int pageSize,
  }) async {
    final request = await _dio.get<List<dynamic>>(
      '${_dio.options.baseUrl}/products',
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
}
