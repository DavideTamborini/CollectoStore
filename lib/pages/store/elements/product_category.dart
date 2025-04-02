import 'package:collecto_store/pages/store/controller/products_controller.dart';
import 'package:collecto_store/pages/store/elements/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategory extends GetView<ProductsController> {
  const ProductCategory({
    required this.categoryName,
    super.key,
  });

  final String categoryName;

  @override
  String get tag => categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _spacer,
        _categoryTitle,
        _spacer,
        _categoryProducts,
      ],
    );
  }

  Widget get _spacer => const SizedBox(height: 10);

  Widget get _categoryTitle => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${categoryName.capitalizeFirst}',
              style: Get.theme.textTheme.titleLarge?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      );

  Widget get _categoryProducts => SizedBox(
        height: Get.height * 0.45,
        child: controller.obx(
          (products) => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ProductCard(products[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: products!.length,
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Text('No products found in this category'.tr),
          onError: (message) => SizedBox.expand(
            child: Center(
              child: Text('$message'.tr),
            ),
          ),
        ),
      );
}
