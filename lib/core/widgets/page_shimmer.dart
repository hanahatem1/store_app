import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class PageShimmer extends StatelessWidget {
  const PageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.greyColor,
        highlightColor: AppColors.greyColorLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 35),
          child: Column(
            children: [
              const ShimmerAppBar(),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.greyColor,
                        ),
                  ),
                  Container(
                    decoration:const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.greyColor,
                        ),
                    height: 35,
                    width: 35,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.greyColor,
                    ),
                    height: 35,
                    width: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.greyColor,
                    ),
                    height: 35,
                    width: 90,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.greyColor,
                    ),
                    height: 35,
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.greyColor,
                    ),
                    height: 35,
                    width: 100,
                  )
                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: .85,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                     return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.greyColor,
                        ),
                        
                      );
                    }
                    ),
              )
            ],
          ),
        ));
  }
}

class ShimmerAppBar extends StatelessWidget {
  const ShimmerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 20,
              color: AppColors.greyColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 180,
              height: 20,
              color: AppColors.greyColor,
            ),
          ],
        ),
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: AppColors.greyColor,
              ),
          height: 35,
          width: 35,
        )
      ],
    );
  }
}
