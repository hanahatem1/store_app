import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/views/login_page.dart';

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if(!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/logo app.png'),
    );
  }
}