import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/widgets/custom_card_cart_item.dart';

class CustomListviewCart extends StatelessWidget {
  const CustomListviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: CustomCardCartItem(),
        );
      },
    );
  }
}
