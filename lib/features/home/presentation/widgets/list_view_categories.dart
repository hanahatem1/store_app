import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_card_categories.dart';

class ListViewCategories extends StatefulWidget {
  final Function(String category) onCategorySelected;
  const ListViewCategories({super.key, required this.onCategorySelected});

  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}

class _ListViewCategoriesState extends State<ListViewCategories> {
   final List<String> categories = [
      'All',
      'electronics',
      "men's clothing",
      "women's clothing",
      'jewelery',
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
                widget.onCategorySelected(categories[index]);
              },
              ),
          );
        },
      ),
    );
  }
}
