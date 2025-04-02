import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_repos/collecto_repos.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin<List<Product>> {
  ProductsController({
    required this.productRepository,
    required this.categoryName,
  });

  final ProductRepository productRepository;
  final String categoryName;

  final ScrollController scrollController = ScrollController();

  List<Product> products = <Product>[].obs;
  bool hasMaxReached = false;

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        fetchProducts();
      }
    });
    fetchProducts();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> fetchProducts() async {
    if (hasMaxReached) return;
    final result = await productRepository.getCategoryItems(
      pageNumber: (products.length / 20).ceil(),
      pageSize: 10,
      categoryName: categoryName,
    );
    result.fold(
      (data) {
        switch (data.length) {
          case 0:
            if (products.isEmpty) {
              change(products, status: RxStatus.empty());
            } else {
              hasMaxReached = true;
            }
          case > 1:
            products = [...products, ...data];
            if (status != RxStatus.success()) {
              change(products, status: RxStatus.success());
            }
        }
      },
      (failure) => change(
        products,
        status: RxStatus.error(failure.statusMessage),
      ),
    );
  }
}
