import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Intro/intro_page_3.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(child: Image.asset('lib/image/intro_page_2.jpeg')),
            ),
            //==========================================================================================================================
            // Text Title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Grab and ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24)),
                Text("Scan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF20d29c))),
              ],
            ),
            //==========================================================================================================================
            // Text Description
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Grab and Scan your fruit through this app",
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
                MaterialPageRoute(builder: (context) => const IntroPage3()),
              ),
              child: Container(
                height: 40,
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
