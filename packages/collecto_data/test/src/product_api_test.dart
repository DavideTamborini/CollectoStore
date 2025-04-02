// ignore_for_file: prefer_const_constructors
import 'package:collecto_data/src/managers/product_api.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  group('Product tests with fake api endpoint', () {
    final client = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
    final productApiManager = ProductApiManager(client);

    test('getItems', () async {
      final apiRequest = await productApiManager.getItems(
        pageNumber: 0,
        pageSize: 20,
      );
      expect(apiRequest.length, 20);
    });

    test('getItem', () async {
      const itemId = 1;
      final apiRequest = await productApiManager.getItem(itemId: itemId);
      expect(apiRequest.id, itemId);
    });

    test('getCategories', () async {
      final apiRequest = await productApiManager.getCategories();
      expect(apiRequest, isA<List<String>>());
    });
  });
}
