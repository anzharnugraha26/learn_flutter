import 'package:flutter/material.dart';
import 'package:health_app_ui/utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black26,
          selectedItemColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home5) , label: ''),
            BottomNavigationBarItem(icon: Icon(Iconsax.calendar_1) , label: ''),
            BottomNavigationBarItem(icon: Icon(Iconsax.message) , label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined) , label: ''),
          ]),
    );
  }
}
