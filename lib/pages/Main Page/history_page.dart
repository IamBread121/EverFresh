import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

final List<Map<String, dynamic>> _historyList = [
  {'name': 'Watermelon', 'qty': 1, 'status': false},
  {'name': 'Strawberry', 'qty': 5, 'status': true},
  {'name': 'Grape', 'qty': 5, 'status': false},
  {'name': 'Papaya', 'qty': 2, 'status': true},
];

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
  @override
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
