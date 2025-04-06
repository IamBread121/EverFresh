import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:food_prediction/pages/Fruit_Page/scan_fruit.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  TextEditingController fruitNameController = TextEditingController();

  void saveFruitToFirebase(String fruitName, int quantity) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return; // Ensure user is signed in

  final uid = user.uid;
  final buyDate = DateTime.now();
  final expiryDate = buyDate.add(const Duration(days: 7));

  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('fruits')
      .add({
    'fruitName': fruitName,
    'quantity': quantity,
    'buyDate': buyDate,
    'expiryDate': expiryDate,
    'remindMe': isToggled1, // update based on switch
    'addToShoppingList': isToggled2, // update based on switch
    'createdAt': FieldValue.serverTimestamp(),
  });
}


  late DateTime today;
  late DateTime expiry;
  late String formattedDate;
  late String formattedExpiry;
  
  @override
  void initState(){
    super.initState();
    today = DateTime.now();
    formattedDate = DateFormat('dd/MM/yyyy').format(today);
    expiry = today.add(Duration(days: 7));
    formattedExpiry = DateFormat('dd/MM/yyyy').format(expiry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //==========================================================================================================================
                // Back Button
                Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const scanFruit())),
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
                  child: SizedBox(
                    height: 30,
                    child: TextField(
                      controller: fruitNameController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 10, bottom: 15),
                        hintText: 'Apple',
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.6)),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
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
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    formattedDate,
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
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    formattedExpiry,
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
                        style: TextStyle(color: Colors.grey),
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
                        style: TextStyle(color: Colors.grey),
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GestureDetector(
                    onTap: () async {
                      String fruitName = fruitNameController.text.trim();
                      
                      if (fruitName.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Fruit name cannot be empty'),
                            backgroundColor: Colors.red, 
                            ),
                        );
                        return;
                      }
                      saveFruitToFirebase(fruitName, quantity);
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => FruitPage())
                        );
                    },
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
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //==========================================================================================================================
              ],
            ),
          ),
        ));
  }
}
