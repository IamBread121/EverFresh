import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}


String returnStatus(bool status) {
  String x = "You didn't finish the ";
  if (status == true) {
    String x = "You finished the ";
    return x;
  } else {
    return x;
  }
}

Color returnColorBackground(bool status) {
  if (status == true) {
    return const Color(0xFFDBEFDC);
  } else {
    return const Color(0xFFFDD9D7);
  }
}

Color returnColorText(bool status) {
  if (status == true) {
    return Colors.black;
  } else {
    return Colors.red;
  }
}

class _HistoryPageState extends State<HistoryPage> {
List<Map<String, dynamic>> _historyList = [];
  @override
  void initState() {
  super.initState();
  fetchHistory();
}
void fetchHistory() async {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  final snapshot = await FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .collection('history')
    .orderBy('timestamp', descending: true)
    .get();

  setState(() {
    _historyList = snapshot.docs.map((doc) => {
      'name': doc['name'],
      'qty': doc['qty'],
      'status': doc['status'],
    }).toList();
  });
}
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "History",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _historyList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: returnColorBackground(
                                  _historyList[index]['status'])),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text(_historyList[index]['name'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(_historyList[index]['qty'].toString(),
                                              style: const TextStyle(
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
                                    padding:
                                        const EdgeInsets.only(bottom: 20, left: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          returnStatus(_historyList[index]['status']),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: returnColorText(
                                                  _historyList[index]['status'])),
                                        ),
                                        Text(
                                          _historyList[index]['name'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: returnColorText(
                                                  _historyList[index]['status'])),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
