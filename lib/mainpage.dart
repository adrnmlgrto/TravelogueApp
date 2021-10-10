import 'package:flutter/material.dart';
import 'package:myflutter/homepage.dart';
import 'package:myflutter/bookAirport.dart';
import 'package:myflutter/bookHotel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myflutter/login.dart';

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

  Widget showScreen(int index) {
    if (index == 0) {
      return HomePage();
    } else if (index == 1) {
      return BookingAir();
    } else if (index == 2) {
      return BookingHotel();
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                'https://i.ibb.co/mt2zFtZ/Profile.jpg',
              ),
            ),
          ),
          Divider(
            height: 70,
            color: Colors.grey,
          ),
          Row(
            children: [
              Icon(Icons.person_outline),
              SizedBox(width: 5),
              Text(
                'NAME',
                style: TextStyle(
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '${widget.fname} ${widget.lname}',
            style: TextStyle(
              color: Colors.amber[900],
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              SizedBox(width: 5),
              Text(
                'EMAIL',
                style: TextStyle(
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '${widget.email}',
            style: TextStyle(
              color: Colors.amber[900],
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 130),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text('LOGOUT'))),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pageScreens[currentIndex],
      body: showScreen(currentIndex),
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
