import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/loading_indicator.dart';
import 'package:shopping_app/features/favourites/data/cubit/favourites_cubit.dart';
import 'package:shopping_app/features/favourites/presentation/widgets/custom_card_fav_item.dart';

class CustomListviewFav extends StatefulWidget {
  const CustomListviewFav({super.key});

  @override
  State<CustomListviewFav> createState() => _CustomListviewFavState();
}

class _CustomListviewFavState extends State<CustomListviewFav> {
  void initstate(){
    super.initState();
    context.read<FavouritesCubit>().getFavourites();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if(state is FavouritesLoading){
        return const Center(child:LoadingIndicator());
        }
        else if(state is FavouritesSuccess){
          final favList = state.product;
        return ListView.builder(
          itemCount: favList.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding:const EdgeInsets.only(bottom: 5),
              child: CustomCardFavItem(product:favList[index],),
            );
          },
        );
        }else if(state is FavouritesFailure){
          return Text(state.errMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
