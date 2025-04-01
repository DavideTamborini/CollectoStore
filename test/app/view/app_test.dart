import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_store/app/app.dart';
import 'package:collecto_store/pages/home/view/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    final fakeApiClient = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
  });
}
