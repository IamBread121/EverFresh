import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Login/Signup/login_page.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(child: Image.asset('lib/image/intro_page_3.png')),
            ),
            //==========================================================================================================================
            // Text Title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Track Your Fruit ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text("Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF20d29c))),
              ],
            ),
            //==========================================================================================================================
            // Text Description
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Scan, organize, and recieve freshness alerts to reduce waste and enjoy perfectly ripe fruit every time",
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
                MaterialPageRoute(builder: (context) => const LoginPage1()),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
