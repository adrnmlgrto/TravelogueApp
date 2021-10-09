import 'package:flutter/material.dart';
import 'package:myflutter/homepage.dart';
import 'package:myflutter/bookAirport.dart';
import 'package:myflutter/bookHotel.dart';

class MainPage extends StatefulWidget {
  final String fname;
  final String lname;
  final String email;

  const MainPage(
      {Key? key, required this.fname, required this.lname, required this.email})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

// class UserDetails {
//   String? fname;
//   String? lname;
//   String? email;

//   UserDetails(String fname, String lname, String email) {
//     this.fname = fname;
//     this.lname = lname;
//     this.email = email;
//   }
// }

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final pageScreens = [
    HomePage(),
    BookingAir(),
    BookingHotel(),
    Center(
      child: Text('PROFILE'),
    ),
  ];

  // Future createProfile(int index) async {
  //   String f_name = widget.fname;
  //   String l_name = widget.lname;
  //   String e_mail = widget.email;

  //   UserDetails person = UserDetails(f_name, l_name, e_mail);

  //   print('${person.email}');
  // }

  @override
  Widget build(BuildContext context) {
    // print(widget.fname);
    // print(widget.lname);
    // print(widget.email);
    return Scaffold(
      body: pageScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active_outlined),
            label: "Book Flight",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_rounded),
            label: "Book Hotel",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
