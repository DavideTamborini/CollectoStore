import 'package:collecto_store/app/app.dart';
import 'package:collecto_store/bootstrap.dart';
import 'package:flutter/cupertino.dart';

// This entrypoint retrieves data from Production environment,
// please specify the correct endpoint to use in "bindings" folder

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(App.new);
}
