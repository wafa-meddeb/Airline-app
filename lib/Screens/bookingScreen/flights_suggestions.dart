import 'package:flutter/material.dart';

class FlightsSuggestions extends StatefulWidget {
  const FlightsSuggestions({Key? key}) : super(key: key);

  @override
  _FlightsSuggestionsState createState() => _FlightsSuggestionsState(); //to create the state of the widget 
} // "=> _FlightsSuggestionsState()" is equivalent to "{return _FlightsSuggestionsState();}

class _FlightsSuggestionsState extends State<FlightsSuggestions> {
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flights Suggestions"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Flights Suggestions page")
            ],
          ),
        )
      
        )
        );
    }
}


