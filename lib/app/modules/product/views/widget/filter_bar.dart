import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../theme/app_color.dart';
import 'product_filter_bottom_sheet.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        // Get.bottomSheet(ProductFilterBottomSheet());
        showModalBottomSheet(
            context: context, builder: (c) => ProductFilterBottomSheet());
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: const Offset(0, 3),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/filter.png',
                  height: 20,
                  color: AppColors.ternaryText,
                ),
                12.ws,
                Text(
                  'Filter',
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 16,
                    color: AppColors.ternaryText,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Sort by',
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 16,
                    color: AppColors.ternaryText,
                  ),
                ),
                12.ws,
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.ternaryText,
                ),
              ],
            ),
            10.ws,
            const Icon(Icons.format_list_bulleted),
          ],
        ),
      ),
    );
  }
}
