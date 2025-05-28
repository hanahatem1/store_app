import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/data/home_cubit/home_cubit.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/data/search_cubit/search_cubit.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_circle_container.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_gridview.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:shopping_app/features/home/presentation/widgets/list_view_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: BlocBuilder<HomeCubit,HomeState>(
        builder:(context,state){
          if(state is HomeLoading){
            return const CircularProgressIndicator();
          } else if(state is HomeSuccess){
            return BlocProvider(
              create:(_) => SearchCubit(state.products),
              child: HomeContent(products: state.products),
              );
          } else if(state is HomeFailure){
            return Text(state.errMessage);
          }else{
            return const SizedBox.shrink();
          }
        }
      )
    );
  }
}

class HomeContent extends StatelessWidget{
  const HomeContent ({super.key, required this.products});
final List<ProductModel> products;
  @override
 Widget build(BuildContext context){
  return SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
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
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if(state is SearchInitial){
                    return CustomGridview(products: products);
                  }
                   else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchSuccess) {
                    return CustomGridview(products: state.product);
                  } else if (state is SearchError) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      );
 }
}
