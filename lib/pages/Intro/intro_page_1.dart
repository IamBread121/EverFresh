import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Intro/intro_page_2.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //==========================================================================================================================
            Expanded(
              child: Center(child: Image.asset('lib/image/intro_page_1.jpg')),
            ),
            //==========================================================================================================================
            // Text Title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Easy To ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text("Use",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF20d29c))),
              ],
            ),
            //==========================================================================================================================
            // Text Description
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "An easy-to-use fruit organizer mobile app helps users manage and track their fruits",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            //==========================================================================================================================
            // start button
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IntroPage2()),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0dc6b5), Color(0xFF28d892)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
