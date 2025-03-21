import 'package:flutter/material.dart';
import 'package:food_prediction/pages/home_page.dart';
import 'package:food_prediction/pages/Fruit_Page/scan_fruit.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({super.key});

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  final List<Map<String, dynamic>> _fruitList = [
    {'name': 'Banana', 'qty': 5},
    {'name': 'Strawberry', 'qty': 6},
    {'name': 'Apple', 'qty': 1},
    {'name': 'Kiwi', 'qty': 2},
    {'name': 'Pear', 'qty': 8},
    {'name': 'Pineapple', 'qty': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //==========================================================================================================================
              // Back Button
              Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage())),
                    child: const Icon(Icons.keyboard_backspace),
                  )),
              //==========================================================================================================================
              // Fruits Title
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Fruits",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //==========================================================================================================================
              // Fruits List
              Expanded(
                child: ListView.builder(
                    itemCount: _fruitList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  _fruitList[index]['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      _fruitList[index]['qty'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              //==========================================================================================================================
              // Add Fruit Button
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const scanFruit())),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
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
                              "Add Fruit",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //==========================================================================================================================
            ])));
  }
}
