import 'package:cherrystreet/common/comingSoon.dart';
import 'package:cherrystreet/constants/colors.dart';
import 'package:cherrystreet/features/advisor/presentation/pages/advisorPage.dart';
import 'package:cherrystreet/features/home/presentation/pages/homePage.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  final screens = [
    const HomePage(),
    const ComingSoon(),
    const AdvisorPage(),
    const ComingSoon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.isNotEmpty ? screens[selectedIndex] : const SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: AppColors.white,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryClr,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart, size: 25),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline, size: 25),
            label: 'Advisor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 25),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
