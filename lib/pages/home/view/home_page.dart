import 'package:collecto_store/pages/home/controller/products_controller.dart';
import 'package:collecto_store/pages/home/view/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<ProductsController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (products) => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ProductCard(products[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: products!.length,
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: const Text('empty'),
          onError: (message) => Text('$message'),
        ),
      ),
    );
  }
}
