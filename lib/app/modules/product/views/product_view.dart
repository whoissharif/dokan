import 'package:dokan/app/modules/product/views/widget/product_grid_card.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const FilterBar(),
              20.hs,
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.products.length,
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
                          return controller.products.isEmpty
                              ? const SizedBox()
                              : ProductGridCard(
                                  product: controller.products[i],
                                );
                        }),
              ),
              150.hs,
            ],
          ),
        ),
      ),
    );
  }
}
