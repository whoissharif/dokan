import 'package:dokan/app/modules/product/model/product_model.dart';
import 'package:dokan/app/modules/product/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var fetchedProducts = await ProductRepository().fetchProduct();
      products.assignAll(fetchedProducts);
    } finally {
      isLoading(false);
    }
  }
}
