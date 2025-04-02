import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/pages/store/controller/categories_controller.dart';
import 'package:collecto_store/pages/store/controller/products_controller.dart';
import 'package:collecto_store/pages/store/elements/product_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'bottombar.dart';

part 'appbar.dart';

class StorePage extends GetView<CategoriesController> {
  const StorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const AppBarStore(),
        bottomNavigationBar: const StoreBottomNavigationBar(),
        body: controller.obx(
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
                  _searchBar,
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

  Widget get _searchBar => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CupertinoSearchTextField(
                  placeholder: '7 products available'.tr,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.close),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () => Get.log('Filter list clicked'),
                child: const Icon(Icons.filter_list),
              ),
            ],
          ),
        ),
      );
}
