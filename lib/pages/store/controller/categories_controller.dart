import 'package:collecto_repos/collecto_repos.dart';
import 'package:collecto_store/common/common.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController
    with StateMixin<List<String>> {
  CategoriesController(this.productRepository);

  final ProductRepository productRepository;

  List<String> categories = <String>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    final result = await productRepository.getCategories();
    result.fold(
      (data) => change(
        data,
        status: data.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      ),
      (failure) => change(
        categories,
        status: RxStatus.error(failure.userFriendlyMessage),
      ),
    );
  }
}
