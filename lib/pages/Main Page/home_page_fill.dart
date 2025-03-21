import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/expiring_fruit.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:food_prediction/pages/Login/Signup/login_page.dart';
import 'package:food_prediction/pages/util/homep_tile.dart';

class HomePageFill extends StatefulWidget {
  const HomePageFill({super.key});

  @override
  State<HomePageFill> createState() => _HomePageFillState();
}

class _HomePageFillState extends State<HomePageFill> {
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    if(mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage1())
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _logout(),
        backgroundColor: Colors.red,
        child: const Icon(Icons.logout),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                //==========================================================================================================================
                      const SizedBox(
                        height: 50,
                      ),
                //==========================================================================================================================
                // Fruits Title
                      const Text(
                        "Fruits",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                //==========================================================================================================================
                      const SizedBox(
                        height: 50,
                      ),
                //==========================================================================================================================
                //Fruit Description
                      const Text(
                        "Some fruits expiring soon",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                //=======================================================
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Don't let them go to waste!",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                //==========================================================================================================================
                // Fruit List
                      Flexible(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ListView(
                              shrinkWrap: true,
                              children: const [
                                HomepTile(
                                  date: 3,
                                  quantity: 5,
                                  fruitname: "Banana",
                                ),
                                HomepTile(
                                  date: 2,
                                  quantity: 6,
                                  fruitname: "Strawberry",
                                ),
                                HomepTile(
                                  date: 4,
                                  quantity: 1,
                                  fruitname: "Apple",
                                ),
                                HomepTile(
                                  date: 6,
                                  quantity: 2,
                                  fruitname: "Kiwi",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                /*
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 30),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red.withOpacity(0.2)),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text("Banana",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 30),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 50, left: 20),
                                    child: Text("Expiring in 2 Days",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red
                                    ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 40),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow.withOpacity(0.25)),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text("Lemon",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 30),
                                          child: Text("3",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 50, left: 20),
                                    child: Text("Expiring in 5 Days",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red
                                    ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                */
                //==========================================================================================================================
                // Buttons
                // Fruit Button
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FruitPage())),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF0dc6b5),
                                      Color(0xFF28d892)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Center(
                                    child: Text(
                                      "Your Fruit List",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ExpiringFruit())),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF0dc6b5),
                                        Color(0xFF28d892)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Center(
                                      child: Text(
                                        "Expiring Fruit List",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                
                //==========================================================================================================================
                // Expiring Fruit Button
                    ]))));
  }
}
