import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/core/widgets/page_shimmer.dart';
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
            return const PageShimmer();
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

class HomeContent extends StatefulWidget{
  const HomeContent ({super.key, required this.products});
final List<ProductModel> products;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  late List <ProductModel> filterdProducts;
  @override
void initState(){
  super.initState();
  filterdProducts=widget.products;
}
void filterByCategory(String category){
if(category=='All'){
  setState(() {
    filterdProducts=widget.products;
  });
}else{
  setState(() {
    filterdProducts=widget.products.
    where((product) => product.category==category).toList();
  });
}
}
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
              ListViewCategories(onCategorySelected:filterByCategory),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if(state is SearchInitial){
                    return CustomGridview(products: filterdProducts);
                  }
                   else if (state is SearchLoading) {
                    return const PageShimmer();
                  } else if (state is SearchSuccess) {
                    if(state.product.isEmpty){
                      return const Center(child: 
                       Text('There are no products match this'));
                    }else {
                      return CustomGridview(products: state.product);
                    }
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
