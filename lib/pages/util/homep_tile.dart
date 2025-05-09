import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomepTile extends StatefulWidget {
  const HomepTile({
    super.key,
    required this.date,
    required this.quantity,
    required this.fruitname,
    required this.fruitId,
    this.onRemoved,
  });

  final int date;
  final int quantity;
  final String fruitname;
  final String fruitId;
  final VoidCallback? onRemoved;

  @override
  State<HomepTile> createState() => _HomepTileState();
}

class _HomepTileState extends State<HomepTile> {
  late int currentQuantity;

  @override
  void initState() {
    super.initState();
    currentQuantity = widget.quantity;
  }

  Color backgroundColorPick(int date) {
    if (date < 3) {
      return Colors.red.withOpacity(0.2);
    } else if (date < 5) {
      return Colors.yellow.withOpacity(0.2);
    } else {
      return Colors.green.withOpacity(0.2);
    }
  }

  Color textColorPick(int date) {
    if (date < 5) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Future<void> eatFruit() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('fruits')
        .doc(widget.fruitId);

    if (currentQuantity > 1) {
      await docRef.update({'quantity': currentQuantity - 1});
      setState(() {
        currentQuantity--;
      });
    } else {

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('history')
          .add({
        'name': widget.fruitname,
        'qty': 1,
        'status': true, // true = eaten
        'timestamp': Timestamp.now(),
      });
      await docRef.delete();

      if(widget.onRemoved != null) {
        widget.onRemoved!();
      }
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You ate one ${widget.fruitname}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FruitPage())),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColorPick(widget.date),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Text(widget.fruitname,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Flexible(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(currentQuantity.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Expiring in ${widget.date} days",
                    style: TextStyle(
                      fontSize: 14,
                      color: textColorPick(widget.date),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: eatFruit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Eat"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
