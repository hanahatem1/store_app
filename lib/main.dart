import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/favourites/data/cubit/favourites_cubit.dart';
import 'package:shopping_app/features/home/data/home_cubit/home_cubit.dart';
import 'package:shopping_app/features/splash/views/splash_page.dart';
import 'package:shopping_app/firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home:SplashPage(),
      ),
    );
  }
}
  
