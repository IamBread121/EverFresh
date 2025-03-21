import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey,
        tabBackgroundColor: const Color.fromARGB(255, 214, 214, 214),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 30,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
        GButton(
          icon: Icons.apple_outlined,
          text: "Fruits",
        ),
        GButton(
          icon: Icons.trolley,
          text: "Shopping List",
        ),
        GButton(
          icon: Icons.history,
          text: "History",
        ),
        ],
      ),
    );
  }
}