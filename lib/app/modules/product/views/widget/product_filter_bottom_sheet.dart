import '../../../common/widgets/app_outlined_button.dart';
import '../../../../../theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_elevated_button.dart';
import '../../controllers/product_controller.dart';

class ProductFilterBottomSheet extends StatelessWidget {
  final ProductController productController = Get.find();

  void applyFilters() {
    productController.applyFilters();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0, left: 16),
            child: Text(
              'Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Obx(
            () => Column(
              children: [
                FilterCheckboxItem(
                  value: productController.selectedSortOption.value == 'Newest',
                  onChanged: (value) {
                    productController.selectedSortOption.value =
                        value! ? 'Newest' : '';
                  },
                  text: 'Newest',
                ),
                FilterCheckboxItem(
                  value: productController.selectedSortOption.value == 'Oldest',
                  onChanged: (value) {
                    productController.selectedSortOption.value =
                        value! ? 'Oldest' : '';
                  },
                  text: 'Oldest',
                ),
                FilterCheckboxItem(
                  value: productController.selectedPriceRange.value ==
                      'Price low > High',
                  onChanged: (value) {
                    productController.selectedPriceRange.value =
                        value! ? 'Price low > High' : '';
                  },
                  text: 'Price low > High',
                ),
                FilterCheckboxItem(
                  value: productController.selectedPriceRange.value ==
                      'Price high > Low',
                  onChanged: (value) {
                    productController.selectedPriceRange.value =
                        value! ? 'Price high > Low' : '';
                  },
                  text: 'Price high > Low',
                ),
                FilterCheckboxItem(
                  value: productController.isBestSelling.value,
                  onChanged: (value) {
                    productController.isBestSelling.value = value!;
                  },
                  text: 'Best selling',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppOutlinedButton(
                  onTap: () => Get.back(),
                  text: 'Cancel',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppElevatedButton(
                  onTap: applyFilters,
                  text: 'Apply',
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterCheckboxItem extends StatelessWidget {
  const FilterCheckboxItem({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            color: AppColors.accentColor,
            width: 1.5,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
