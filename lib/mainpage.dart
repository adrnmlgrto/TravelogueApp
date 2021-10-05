import 'package:flutter/material.dart';
import 'package:myflutter/homepage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final pageScreens = [
    HomePage(),
    const Center(child: Text("Book", style: TextStyle(fontSize: 30))),
    const Center(child: Text("Destinations", style: TextStyle(fontSize: 30))),
    const Center(child: Text("Profile", style: TextStyle(fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active_outlined),
            label: "Book",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_rounded),
            label: "Destinations",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
