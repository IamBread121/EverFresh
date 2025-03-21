// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:food_prediction/components/bottom_nav.dart';
import 'package:food_prediction/pages/Fruit_Page/expiring_fruit.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:food_prediction/pages/Main%20Page/history_page.dart';
import 'package:food_prediction/pages/Main%20Page/home_page_fill.dart';
import 'package:food_prediction/pages/Main%20Page/shopping_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePageFill(),
    const ShoppingList(),
    const HistoryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
        bottomNavigationBar: BottomNav(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedIndex]
    );
  }
}
