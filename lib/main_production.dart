import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_store/app/app.dart';
import 'package:collecto_store/bootstrap.dart';
import 'package:flutter/cupertino.dart';

// This entrypoint retrieves data from Production environment,
// please specify the correct endpoint to use

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final fakeApiClient = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com', // insert here api endpoint
    ),
  );

  bootstrap(() => App(apiClient: fakeApiClient));
}
