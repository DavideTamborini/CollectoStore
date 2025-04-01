import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_store/app/app.dart';
import 'package:collecto_store/bootstrap.dart';
import 'package:flutter/cupertino.dart';

// This entrypoint retrieves fake data from FakeApiStore
// (https://fakestoreapi.com/)

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final fakeApiClient = Dio(
    BaseOptions(baseUrl: 'https://fakestoreapi.com'),
  );

  bootstrap(() => App(apiClient: fakeApiClient));
}
