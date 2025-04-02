import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/app/bindings/bindings.dart';
import 'package:collecto_store/pages/home/controller/products_controller.dart';
import 'package:collecto_store/pages/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // Product controller injection
    Get.put(
      ProductsController(
        RepositoryProvider.of<ProductRepository>(context),
      ),
    );

    return GetMaterialApp(
      home: const HomePage(),
      initialBinding: DependenciesBinding(),
    );
  }
}
