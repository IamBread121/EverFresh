import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/expiring_fruit.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:food_prediction/pages/Login/Signup/login_page.dart';
import 'package:food_prediction/pages/util/homep_tile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageFill extends StatefulWidget {
  const HomePageFill({super.key});

  @override
  State<HomePageFill> createState() => _HomePageFillState();
}

class _HomePageFillState extends State<HomePageFill> {
  List<Map<String, dynamic>> _fruits = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFruitsFromFirebase();
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage1()),
      );
    }
  }

  Future<void> fetchFruitsFromFirebase() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('fruits')
        .get();

    setState(() {
      _fruits = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
      _isLoading = false;
    });
  }

  int calculateRemainingDays(Timestamp expiryDate) {
    final expiry = expiryDate.toDate();
    final now = DateTime.now();
    return expiry.difference(now).inDays;
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFFFFFFF),
    body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Fruits",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Some fruits expiring soon",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Don't let them go to waste!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                //==================== Fruit List ====================
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _fruits.isEmpty
                              ? const Center(child: Text("No fruits available"))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _fruits.length,
                                  itemBuilder: (context, index) {
                                    final fruit = _fruits[index];
                                    return HomepTile(
                                      fruitname: fruit['fruitName'],
                                      quantity: fruit['quantity'],
                                      date: calculateRemainingDays(fruit['expiryDate']),
                                      fruitId: fruit['id'],
                                      onRemoved: () {
                                        setState(() {
                                          if (index >= 0 && index < _fruits.length) {
                                          _fruits.removeAt(index);
                                          }
                                        });
                                      },
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
                //==================== Buttons ====================
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FruitPage()),
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
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                "Your Fruit List",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ExpiringFruit()),
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
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                "Expiring Fruit List",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // ============= Top Right FAB ===================
        Positioned(
          top: 40,
          right: 20,
          child: FloatingActionButton(
            onPressed: _logout,
            backgroundColor: Colors.red,
            child: const Icon(Icons.logout),
          ),
        ),
      ],
    ),
  );
}
}