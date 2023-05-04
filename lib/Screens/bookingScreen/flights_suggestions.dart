import 'package:flutter/material.dart';

class FlightsSuggestions extends StatefulWidget {
  const FlightsSuggestions({Key? key}) : super(key: key);

  @override
  _FlightsSuggestionsState createState() => _FlightsSuggestionsState();
}

class _FlightsSuggestionsState extends State<FlightsSuggestions> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flights Suggestions"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Flights Suggestions page")
          ],
        )
      
        )
        );
    }
