import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/widgets/custom_circle_container.dart';
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
            SizedBox(
              height: 220,
              width: 220,
              child: Card(    
                elevation: 2,
                color: AppColors.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/b.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Bijama'),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            child: const Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(' + Add to cart'),
                            ),
                          ),
                          const Text('\$49')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
