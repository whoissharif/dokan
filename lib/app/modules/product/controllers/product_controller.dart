import 'package:dokan/app/modules/product/model/product_model.dart';
import 'package:dokan/app/modules/product/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs;
  var isLoading = true.obs;
  var selectedSortOption = 'Newest'.obs;
  var selectedPriceRange = ''.obs;
  var isBestSelling = false.obs;

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
      filteredProducts.assignAll(fetchedProducts);
    } finally {
      isLoading(false);
    }
  }

  void applyFilters() {
    filteredProducts.assignAll(products);

    // sorting
    if (selectedSortOption.value == 'Newest') {
      filteredProducts.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
    } else if (selectedSortOption.value == 'Oldest') {
      filteredProducts.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
    }

    // price range filter
    if (selectedPriceRange.value == 'Price low > High') {
      filteredProducts.sort(
          (a, b) => double.parse(a.price!).compareTo(double.parse(b.price!)));
    } else if (selectedPriceRange.value == 'Price high > Low') {
      filteredProducts.sort(
          (a, b) => double.parse(b.price!).compareTo(double.parse(a.price!)));
    }

    // best selling filter
    if (isBestSelling.value) {
      filteredProducts.value =
          filteredProducts.where((product) => product.totalSales! > 0).toList();
    }
  }
}
