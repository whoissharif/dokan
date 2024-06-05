import 'package:dokan/app/modules/product/views/widget/product_grid_card.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/product_controller.dart';
import 'widget/filter_bar.dart';

class ProductView extends GetView<ProductController> {
  ProductView({super.key});

  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/search.png',
                  height: 20,
                  width: 20,
                )),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchProducts();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const FilterBar(),
                20.hs,
                Obx(
                  () => controller.isLoading.value
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: 6, // Number of shimmer items
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .6,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                          ),
                          itemBuilder: (context, i) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 20,
                                        width: double.infinity,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 20,
                                        width: 100,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.filteredProducts.length,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .6,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                          ),
                          itemBuilder: (context, i) {
                            return controller.filteredProducts.isEmpty
                                ? const SizedBox()
                                : ProductGridCard(
                                    product: controller.filteredProducts[i],
                                  );
                          },
                        ),
                ),
                150.hs,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
