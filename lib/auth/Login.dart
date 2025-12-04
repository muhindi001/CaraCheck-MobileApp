// import 'package:carecheck/components/my_button.dart';
import 'package:carecheck/components/my_textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
   Login({super.key});

    // text editing controller
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

    // register user in method
  void registerUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // email textfield
          MyTextField(
            Controller: emailController,
            hintText: "Email",
            obscureText: false,
          ),
          const SizedBox(height: 10),

          // password textfield
          MyTextField(
            Controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),

        ],
      ),
    );
  }
}