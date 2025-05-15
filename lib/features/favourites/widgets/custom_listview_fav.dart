import 'package:flutter/material.dart';
import 'package:shopping_app/features/favourites/widgets/custom_card_fav_item.dart';

class CustomListviewFav extends StatelessWidget {
  const CustomListviewFav({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: CustomCardFavItem(),
        );
      },
    );
  }
}
