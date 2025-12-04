// ignore_for_file: file_names

import 'package:carecheck/SplashScreen/Confirm_Page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          // TOP IMAGE
          Expanded(
            flex: 5,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                "lib/assets/image01.png",
                height: size.height / 2,
                width: size.width / 1,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // BOTTOM CARD
          Expanded(
            flex: 4,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: const BoxDecoration(
                color: Color(0xff004d1a), // green
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Consult Form Anywhere",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Connect face-to-face with trusted doctors\nright from comfort of your home",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SwipeableButtonView(
                        buttonText: "Slide to Continue",
                        buttontextstyle: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        ),
                        activeColor: Colors.green[500]!,
                        onWaitingProcess: () {
                          Future.delayed(
                            Duration(seconds: 2),
                            () => setState(() =>isFinished = true));
                        },
                        isFinished: isFinished,
                        onFinish: () async {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: ConfirmationPage(),
                            ),
                          );
                          setState(() => isFinished = false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
