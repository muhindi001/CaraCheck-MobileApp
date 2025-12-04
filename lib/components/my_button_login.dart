import 'package:flutter/material.dart';

class MyButtonLogin extends StatelessWidget {
  final Function()? onTap;
  const MyButtonLogin({
    super.key,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(color: Colors.green[900],
        borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
            ),
        ),
      ),
    );
  }
}