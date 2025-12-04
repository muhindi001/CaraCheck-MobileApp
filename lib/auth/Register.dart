// import 'package:carecheck/components/my_button.dart';
import 'package:carecheck/components/my_textfield.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
   Register({super.key});

  // text editing controller
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmedpasswordController = TextEditingController();

  // register user in method
  void registerUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // fullname textfield
          MyTextField(
            Controller: fullnameController,
            hintText: "Fullname",
            obscureText: false,
          ),
          const SizedBox(height: 10,),

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
          const SizedBox(height: 10),

          // confirmedpassword textfield
          MyTextField(
            Controller: confirmedpasswordController,
            hintText: "ConfirmedPassword",
            obscureText: true,
          ),
          // register button
          // MyButton(
          //   onTap: registerUserIn,
          // )
        ],
      ),
    );
  }
}