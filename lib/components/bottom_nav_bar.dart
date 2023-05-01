import 'package:airline_app/Screens/homepage/homepage_screen.dart';
import 'package:flutter/material.dart';

import '../Screens/booking_screen.dart';
import '../flights_screen.dart';



class NavigationBottom extends StatefulWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _currentIndex = 0;
  final List<Widget> _interfaces = const [Homepage(),Booking(),Flights()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _interfaces[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Booking"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight),
              label: "Flights"
          )
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
