import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/views/login_page.dart';
import 'package:shopping_app/features/home/data/home_cubit/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..featchHomeData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:LoginPage(),
      ),
    );
  }
}
  
