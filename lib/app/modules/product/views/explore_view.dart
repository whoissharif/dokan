import 'package:dokan/theme/app_color.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/app.png',
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
                'Nothing to explore at this moment',
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
