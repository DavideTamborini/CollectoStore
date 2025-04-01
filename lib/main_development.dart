import 'package:collecto_store/app/app.dart';
import 'package:collecto_store/bootstrap.dart';
import 'package:flutter/cupertino.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  final fakeApiClient = Dio();

  bootstrap(() => const App());
}
