import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/pages/store/controller/categories_controller.dart';
import 'package:collecto_store/pages/store/controller/products_controller.dart';
import 'package:collecto_store/pages/store/elements/product_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<CategoriesController> {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (categories) {
            // Controller injection
            for (final category in categories ?? <String>[]) {
              Get.put(
                ProductsController(
                  productRepository: Get.find<ProductRepository>(),
                  categoryName: category,
                ),
                tag: category,
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (final category in categories!)
                    ProductCategory(
                      categoryName: category,
                    ),
                ],
              ),
            );
          },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Text('No category found'.tr),
          onError: (message) => SizedBox.expand(
            child: Center(
              child: Text('$message'.tr),
            ),
          ),
        ),
      ),
    );
  }
}
