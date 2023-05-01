import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Booking page"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Booking screen"))
    );
  }
}