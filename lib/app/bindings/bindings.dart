import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/pages/store/controller/categories_controller.dart';
import 'package:get/get.dart';

class DependenciesBinding implements Bindings {
  @override
  void dependencies() {
    final apiClient = Dio(
      BaseOptions(baseUrl: 'https://fakestoreapi.com'),
    );
    final productRepo = ProductRepository(
      productApi: ProductApiManager(apiClient),
    );

    // Dependency injection
    Get
      ..put(productRepo)
      ..put(CategoriesController(productRepo));
  }
}
