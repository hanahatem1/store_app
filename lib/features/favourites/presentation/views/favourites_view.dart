import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/favourites/presentation/widgets/custom_listview_fav.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        centerTitle: true,
        title:const Text('Favourites',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal:12,vertical: 12),
        child: CustomListviewFav()
      ),
    );
  }
}