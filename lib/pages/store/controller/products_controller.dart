import 'package:collecto_data/collecto_data.dart';
import 'package:collecto_repos/collecto_repos.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController with StateMixin<List<Product>> {
  ProductsController(this.productRepository);

  final ProductRepository productRepository;
  List<Product> products = <Product>[].obs;
  bool hasMaxReached = false;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    if(hasMaxReached) return;
    final result = await productRepository.getItems(
      pageNumber: (products.length / 20).ceil(),
      pageSize: 10,
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
