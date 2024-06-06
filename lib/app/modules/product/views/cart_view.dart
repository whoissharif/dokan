import 'package:dokan/theme/app_color.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/cart.png',
                height: 100,
                color: AppColors.ternaryText,
              ),
              const SizedBox(height: 30),
              Text(
                'Empty',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.secondaryText,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Looks like you haven\'t added anything\nto your cart yet',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.ternaryText,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
