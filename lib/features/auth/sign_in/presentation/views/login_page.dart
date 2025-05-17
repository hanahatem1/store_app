import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/widgets/custom_text_field.dart';
import 'package:shopping_app/features/auth/sign_up/presentation/views/sign_up.dart';
import 'package:shopping_app/features/home/presentation/widgets/home_navigate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                customTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Enter Your Email:',
                  labelText: 'Email',
                ),
                const SizedBox(height: 30),
                customTextField(
                  obscureText: true,
                  onChanged: (data) {
                    pass = data;
                  },
                  hintText: 'Enter Your Password:',
                  labelText: 'Password',
                ),
                const SizedBox(height: 30),
                customButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // TODO: Add your login logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login tapped')),
                      );

                      // Navigate to home
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeNavigate()),
                      );
                    }
                  },
                  text: 'Sign in',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        '  Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
