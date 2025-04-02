import 'package:collecto_store/app/app.dart';
import 'package:collecto_store/bootstrap.dart';
import 'package:flutter/cupertino.dart';

// This entrypoint retrieves fake data from FakeApiStore
// (https://fakestoreapi.com/)

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(App.new);
}
