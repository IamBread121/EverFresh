import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:food_prediction/pages/Fruit_Page/scan_fruit.dart';

class AddFruitNext extends StatefulWidget {
  const AddFruitNext({super.key});

  @override
  State<AddFruitNext> createState() => _AddFruitNextState();
}

class _AddFruitNextState extends State<AddFruitNext> {
  int quantity = 1;
  bool isToggled1 = false;
  bool isToggled2 = false;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//==========================================================================================================================
// Back Button
          Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const scanFruit())),
                child: const Icon(Icons.keyboard_backspace),
              )),
//==========================================================================================================================
// Title
          const Text(
            "Fruit",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
//==========================================================================================================================
// Body
// Fruit Name Title
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Fruit Name",
              style: TextStyle(color: Colors.grey),
            ),
          ),
//==============================================================
// Fruit Name
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Apple"),
                ),
              ),
            ),
          ),
//==================================================================================
// Quantity Title
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              "Quantity",
              style: TextStyle(color: Colors.grey),
            ),
          ),
//==============================================================
// Quantity
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: decrementQuantity,
                  icon: const Icon(Icons.remove),
                  iconSize: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 3.0),
                  child: Text(
                    "$quantity",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                IconButton(
                  onPressed: incrementQuantity,
                  icon: const Icon(Icons.add),
                  iconSize: 15,
                ),
              ],
            ),
          ),
//==================================================================================
// Buy Date Title
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Buy Date",
              style: TextStyle(color: Colors.grey),
            ),
          ),
//==============================================================
// Buy Date
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "30/09/2024",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
//==================================================================================
// Expiry Date Title
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Expiry Date",
              style: TextStyle(color: Colors.grey),
            ),
          ),
//==============================================================
// Expiry Date
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "10/10/2024",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
//==============================================================
// Border Line
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
//==================================================================================
// Refrigirator Title
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Refrigiration",
              style: TextStyle(color: Colors.grey),
            ),
          ),
//==============================================================
// Refrigiration
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "4 - 6 Weeks",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
//==================================================================================
// RoomTemp Title
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Room Temperature",
              style: TextStyle(color: Colors.grey),
            ),
          ),
//==============================================================
// RoomTemp
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "5 - 7 Days",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
//==============================================================
// Border Line
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          ),
//==============================================================
// Remind me Title
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Text(
                  "Remind Me",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
//==============================================================
// Remind me Toggle
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: isToggled1,
                        onChanged: (value) {
                          setState(() {
                            isToggled1 = value;
                          });
                        },
                        activeColor: Colors.teal,
                        activeTrackColor: Colors.tealAccent,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
//==============================================================
// Add to shopping list title
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              children: [
                const Text(
                  "Add to shopping list",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
//==============================================================
// Add to shopping list toggle
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: isToggled2,
                        onChanged: (value) {
                          setState(() {
                            isToggled2 = value;
                          });
                        },
                        activeColor: Colors.teal,
                        activeTrackColor: Colors.tealAccent,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
//==============================================================
// Add button
          Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FruitPage()),(Route<dynamic> route) => false,),
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
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

//==========================================================================================================================
        ],
      ),
    ));
  }
}
