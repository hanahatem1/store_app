import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, UserCredential;
import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/core/widgets/snak_bar_widget.dart';
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
  String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  customTextField(
                    onChanged: (data)=> username=data,
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
                    obscureText: true,
                    onChanged: (data) => pass = data,
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
                              await auth.createUserWithEmailAndPassword(
                            email: email!,
                            password: pass!,
                          );
        
                          await user.user!.updateDisplayName(username);
                          await user.user!.reload();
                          
                         SnakBarWidget.show(context,title: 'Account created successuflly');
        
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                           SnakBarWidget.show(context,title: 'weak password');
                          } else if (ex.code == 'email-already-in-use') {
                           SnakBarWidget.show(context,title: 'email already in use');
                          } else {
                            SnakBarWidget.show(context, title: 'there is an error: ${ex.message}');
                          }
                        }
                      }
                    },
                    text: 'Create Account',
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
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
      ),
    );
  }
}
