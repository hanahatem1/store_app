import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/core/widgets/loading_indicator.dart';
import 'package:shopping_app/features/details/data/details_cubit/details_cubit.dart';
import 'package:shopping_app/features/details/presentation/widgets/colors_row.dart';
import 'package:shopping_app/features/details/presentation/widgets/details_bottom_bar.dart';
import 'package:shopping_app/features/details/presentation/widgets/image_container.dart';

class DetailsPageBody extends StatelessWidget {
  const DetailsPageBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
         if (state is DetailsLoading) {
          return const Scaffold(
            body: Center(child: LoadingIndicator()),
          );
        } else if (state is DetailsFailure) {
          return Scaffold(
            body: Center(child: Text(state.errMessage)),
          );
        } else if (state is DetailsSuccess) {
          final product = state.product;
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageContainer(
                    product: product,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              color: AppColors.secondryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                product.rate.toString(),
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ColorsRow(),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    'About this',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(product.description),
                ],
              ),
            ),
          ),
         bottomNavigationBar:  DetailsBottomBar(product: product,),
        );
        
      }
       return const SizedBox();
      },
    );
  }
}
