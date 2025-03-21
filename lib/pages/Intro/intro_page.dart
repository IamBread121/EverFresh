
import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Intro/intro_page_1.dart';

class IntroPage extends StatelessWidget {
  const IntroPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           children:[
        //==========================================================================================================================
        // Text Title
              const Padding(
                padding: EdgeInsets.only(top: 130.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Waste.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                      ),
                    Text(
                      "Fruit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF20d29c),
                      ),
                      ),
                  ],
                ),
              ),
        //==========================================================================================================================
        // Sub title
            const Text(
              "Organize Fruit",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              ),
        //==========================================================================================================================
        // Logo
            Padding(
              padding: const EdgeInsets.only(top: 90.0, bottom: 100),
              child: Image.asset('lib/image/hp_apple.png', height: 300,),
            ),
        //==========================================================================================================================
        // Start Button
            GestureDetector(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const IntroPage1()),                
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0dc6b5), Color(0xFF28d892)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: 
                  const Padding(
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
          ]
        )
            ),
      )
    );
  }
}