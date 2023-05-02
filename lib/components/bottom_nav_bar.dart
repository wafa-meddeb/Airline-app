import 'package:airline_app/Screens/bookingScreen/bookingScreen.dart';
import 'package:airline_app/constants.dart';
import 'package:flutter/material.dart';

import '../Screens/Profile/ProfileScrren.dart';
import '../Screens/flightsHistScreen/flights_screen.dart';



class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _currentIndex = 0;
  final List<Widget> _interfaces = const [Booking(),Flights(),Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _interfaces[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Booking"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight),
              label: "Flights"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),  
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: darkBlue,
      ),
    );
  }
}
