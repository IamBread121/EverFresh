import 'package:flutter/material.dart';
import 'package:food_prediction/pages/home_page.dart';

class ExpiringFruit extends StatelessWidget {
  const ExpiringFruit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage())),
                      child: const Icon(Icons.keyboard_backspace),
                    )),
//==========================================================================================================================
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow.withOpacity(0.2)),
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.withOpacity(0.2)),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Text("Peach",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                    )),
                                          Flexible(
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 30),
                                                child: Text("5",
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
                                          child: Text("Expiring in 7 Days",
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
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.withOpacity(0.2)),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Text("Grape",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                    )),
                                          Flexible(
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 30),
                                                child: Text("1",
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
                                          child: Text("Expiring in 6 Days",
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
          ],
        ),
      ),
    );
  }
}