import 'package:collecto_store/app/bindings/bindings.dart';
import 'package:collecto_store/pages/store/view/store_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePage(),
      initialBinding: DependenciesBinding(),
    );
  }
}
