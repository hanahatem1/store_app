import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/snak_bar_widget.dart';
import 'package:shopping_app/features/details/presentation/widgets/button_details.dart';
import 'package:shopping_app/features/favourites/data/cubit/favourites_cubit.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final favouritesCubit=context.watch<FavouritesCubit>();
    final isfavourite=favouritesCubit.favouritesList.contains(product);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15,vertical: 24 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonDetails(product: product,),
         GestureDetector(
          onTap: (){
            if(isfavourite){
              favouritesCubit.removeFromFavourites(product);
            }else{
              favouritesCubit.addToFavourites(product);
              SnakBarWidget.show(context, title: 'product added to your favourites');
            }
          },
          child: Image.asset(
            isfavourite
            ?'assets/images/heart.png'
            : 'assets/images/unheart.png', 
            height: 42,width: 42,
            )
          )
        ],
      ),
    );
  }
}
