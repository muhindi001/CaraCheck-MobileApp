// ignore: file_names
import 'package:carecheck/Pages/HomePage.dart';
import 'package:carecheck/auth/Login.dart';
import 'package:carecheck/auth/Register.dart';
import 'package:carecheck/components/my_button.dart';
import 'package:carecheck/components/my_button_login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  // register user in method
  void registerUserIn() {}

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void _showDialog() {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                scale: 2.0,
                child: Lottie.asset("lib/assets/confirm.json"),
              ),
              
              SizedBox(height: 20,),
              Text(
                isLogin? "Login Successful":"Registration Successful",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                isLogin? "Welcome back, we here give you good service.":"Your congratulations to submit you detail and few day leater, willcall you",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            MaterialButton(
              color: Colors.green[900],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()) 
                  );
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Text(
                    "Continue..",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
                ),
              ),
              ),
          ],
        );
      });
  }

  bool isLogin = false;
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP IMAGE
            SizedBox(
              height: 260,
              width: double.infinity,
              child: Image.asset("lib/assets/doctor.png", fit: BoxFit.cover),
            ),
            // WHITE ROUNDED CONTAINER
            Container(
              width: 380,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            ),
            // WHITE ROUNDED CONTAINER
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Center(
                    child: Column(
                      children: [
                        Text(
                          isLogin? "Doctor's Appointment": "Create an account",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isLogin? "Don't have an account":"Already have an account?"
                              ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                isLogin? "register now":"login",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // -------- LOGIN / REGISTER TOGGLE --------
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isLogin = true),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  isLogin
                                      ? Colors.green[900]
                                      : const Color.fromARGB(
                                        255,
                                        190,
                                        244,
                                        192,
                                      ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: isLogin ? Colors.white : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isLogin = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  !isLogin
                                      ? Colors.green[900]
                                      : const Color.fromARGB(
                                        255,
                                        190,
                                        244,
                                        192,
                                      ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: !isLogin ? Colors.white : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                 isLogin? Login(): Register(),

                 const SizedBox(height: 10),
                 isLogin? MyButtonLogin(onTap: _showDialog) : 
                 MyButton(onTap: _showDialog,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
