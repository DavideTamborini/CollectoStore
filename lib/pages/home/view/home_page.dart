import 'package:collecto_store/pages/home/controller/products_controller.dart';
import 'package:collecto_store/pages/home/view/product_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _productScrollController;
  final productController = Get.find<ProductsController>();

  @override
  void initState() {
    super.initState();
    _productScrollController = ScrollController();
    _productScrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _productScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductCategory(
                scrollController: _productScrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_productScrollController.offset >=
        _productScrollController.position.maxScrollExtent) {
      productController.fetchProducts();
    }
  }
}
