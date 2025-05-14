import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/widgets/custom_app_bar.dart';
import 'package:shopping_app/features/home/widgets/custom_circle_container.dart';
import 'package:shopping_app/features/home/widgets/custom_gridview.dart';
import 'package:shopping_app/features/home/widgets/custom_search_bar.dart';
import 'package:shopping_app/features/home/widgets/list_view_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CustomAppBar(),
               SizedBox(
                height: 40,
              ),
               Row(
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
               SizedBox(
                height: 25,
              ),
              ListViewCategories(),
              CustomGridview()
            
            ],
          ),
        ),
      ),
    );
  }
}
