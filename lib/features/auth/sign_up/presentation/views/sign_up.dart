import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/views/login_page.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                const Text('Register',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                customTextField(
                  hintText: 'Enter your username:',
                  labelText: 'User name',
                  ),
                const SizedBox(height: 30),
                customTextField(
                  onChanged: (data) => email = data,
                  hintText: 'Enter Your Email:',
                  labelText: 'Email',
                ),
                const SizedBox(height: 30),
                customTextField(
                  onChanged: (data) => pass = data,
                  hintText: 'Enter Your Password:',
                  labelText: 'Password',
                ),
                const SizedBox(height: 30),
                customButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // TODO: Add your registration logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Register tapped')),
                      );
                      // You could also navigate directly if you want
                    }
                  },
                  text: 'Register',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        '  Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
