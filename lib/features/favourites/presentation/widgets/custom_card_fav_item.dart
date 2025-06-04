import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/core/widgets/snak_bar_widget.dart';
import 'package:shopping_app/features/favourites/data/cubit/favourites_cubit.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class CustomCardFavItem extends StatelessWidget {
  const CustomCardFavItem({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Image.network(
              product.image,
              height: 120,
              width: 120,
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                       Flexible(
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style:const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                                  
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$${product.price}',
                              style:const TextStyle(color: AppColors.secondryColor),
                            )
                          ],
                                             ),
                       ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          final favouritesCubit = context.read<FavouritesCubit>();
                          favouritesCubit.removeFromFavourites(product);
                          SnakBarWidget.show(context,title: 'Product removed from your favourites');
                        },
                        child: Image.asset(
                          'assets/images/heart.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
