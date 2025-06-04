import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_card_categories.dart';

class ListViewCategories extends StatefulWidget {
  const ListViewCategories({super.key});

  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}

class _ListViewCategoriesState extends State<ListViewCategories> {
   final List<String> categories = [
      'All',
      'Electronic',
      "Men's clothes",
      "Women's clothes",
      'Jewelry',
    ];
     int selectedIndex=0;
    @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomCardCategories(
              title: categories[index],
               isSelected: index==selectedIndex,
              onTap: (){
                setState(() {
                  selectedIndex=index;
                });
              },
              ),
          );
        },
      ),
    );
  }
}
