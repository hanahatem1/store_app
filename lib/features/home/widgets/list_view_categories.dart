import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/widgets/custom_card_categories.dart';

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Electronic',
      "Men's clothes",
      "Women's clothes",
      'Jewelry',
    ];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomCardCategories(title: categories[index]),
          );
        },
      ),
    );
  }
}
