import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import './login.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "title of first page",
          body: "here can you the description of the page, to explain someting...",
          image: Center(
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset(
                "assets/lottie/laptop.json",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body: "here you can write the description of the page, to explain someting...",
          image: Center(
            child: Container(
              width: 250,
              height: 250,
              child: Lottie.asset(
                "assets/lottie/login.json",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w500)),
      showNextButton: true,
      next: Text("next >>>"),
      onDone: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()
            ),
        );
      },
    );
  }
}