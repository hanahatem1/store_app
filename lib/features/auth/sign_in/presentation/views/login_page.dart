import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/core/widgets/snak_bar_widget.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/widgets/custom_button.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/widgets/custom_text_field.dart';
import 'package:shopping_app/features/auth/sign_up/presentation/views/sign_up.dart';
import 'package:shopping_app/core/widgets/home_navigate.dart';

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
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        var auth = FirebaseAuth.instance;
                        UserCredential user =
                            await auth.signInWithEmailAndPassword(
                          email: email!,
                          password: pass!,
                        );

                       SnakBarWidget.show(context,title: 'Login done successfully');

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>const HomeNavigate()),
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                         SnakBarWidget.show(context,title: 'The account not found');
                        } else if (ex.code == 'wrong-password') {
                          SnakBarWidget.show(context,title: 'password is wrong');
                        } else {
                          SnakBarWidget.show(context, title: 'there is an error: ${ex.message}');
                        }
                      }
                    }
                  },
                  text: 'Login',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
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
