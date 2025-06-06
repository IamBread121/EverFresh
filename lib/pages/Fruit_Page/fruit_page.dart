import 'package:flutter/material.dart';
import 'package:food_prediction/pages/home_page.dart';
import 'package:food_prediction/pages/Fruit_Page/scan_fruit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FruitPage extends StatefulWidget {
  const FruitPage({super.key});

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  List<Map<String, dynamic>> _fruitList = [];
  
    @override
  void initState() {
    super.initState();
    fetchFruitData();
  }

  Future<void> fetchFruitData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('fruits')
        .get();

    final List<Map<String, dynamic>> loadedFruits = snapshot.docs.map((doc) {
      return {
        'name': doc['fruitName'],
        'qty': doc['quantity'],
      };
    }).toList();

    setState(() {
      _fruitList = loadedFruits;
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: () async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
      return false; // prevent default back navigation
    },
      child: Scaffold(
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
              ]))),
    );
  }
}
