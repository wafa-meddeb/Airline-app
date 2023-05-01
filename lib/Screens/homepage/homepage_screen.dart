import 'package:flutter/material.dart';

import '../flightsHistScreen/flights_screen.dart';
import '../bookingScreen/booking_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      ///body:           Image.asset("assets/images/plane.jpg",fit: BoxFit.fitHeight,height: 550,width: MediaQuery.of(context).size.width,),
    );
  }
}