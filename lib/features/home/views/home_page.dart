import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/widgets/custom_circle_container.dart';
import 'package:shopping_app/features/home/widgets/custom_gridview_item.dart';
import 'package:shopping_app/features/home/widgets/custom_search_bar.dart';
import 'package:shopping_app/features/home/widgets/list_view_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Your',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Favourites product',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                CustomCircleContainer(
                  color: AppColors.cardColor,
                  child: Image.asset('assets/images/proicons_bell.png'),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSearchBar(),
                CustomCircleContainer(
                    color: AppColors.primaryColor,
                    child: Icon(
                      Icons.filter_list,
                      color: AppColors.cardColor,
                    ))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const ListViewCategories(),
            const SizedBox(
              height: 25,
            ),
          const CustomGridviewItem()
          ],
        ),
      ),
    );
  }
}
