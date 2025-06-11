import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/favourites/data/cubit/favourites_cubit.dart';
import 'package:shopping_app/features/home/data/home_cubit/home_cubit.dart';
import 'package:shopping_app/core/widgets/home_navigate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchHomeData(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => FavouritesCubit(),
        ),
        
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeNavigate(),
      ),
    );
  }
}
  
