import 'package:cached_network_image/cached_network_image.dart' as cni;
import 'package:dokan/core/utils/size_extension.dart';
import 'package:dokan/theme/app_color.dart';
import 'package:flutter/material.dart';
import '../../model/product_model.dart';

class ProductGridCard extends StatelessWidget {
  final ProductModel product;

  const ProductGridCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () =>  Get.toNamed(Routes.Product_DETAIL, arguments: Product),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor,
                offset: const Offset(0, 3),
                spreadRadius: 2,
                blurRadius: 5)
          ],
        ),
        child: SizedBox(
          width: 180,
          // height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: cni.CachedNetworkImage(
                    // imageUrl:
                    //     'https://cdn.shopify.com/s/files/1/0023/1342/0889/products/ClassicShirt_White_1_5cd5bf10-af18-4d0b-a477-bc3422d8401a.jpg?v=1688497040',
                    imageUrl: product.images!.last.src!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        cni.CachedNetworkImage(
                      imageUrl:
                          'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                          fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText),
                    ),
                    8.hs,
                    Row(
                      children: [
                        Text(
                          '\$${product.regularPrice}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.ternaryText,
                            decoration: TextDecoration.lineThrough,
                            // color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        12.ws,
                        Text(
                          '\$${product.regularPrice}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    8.hs,
                    Text(
                      '${product.totalSales} Sold',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ternaryText,
                      ),
                    ),
                  ],
                ),
              ),
              // Icon(
              //   isFavorite ? Icons.favorite : Icons.favorite_border,
              //   color: isFavorite ? Colors.red : Colors.grey,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
