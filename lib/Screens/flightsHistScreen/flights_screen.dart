import 'package:flutter/material.dart';
import '../bookingScreen/ticket.dart';

class Flights extends StatelessWidget {
  const Flights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: SingleChildScrollView(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(
              "Flights history",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
          ),
         
                Center(child: TicketView(isOrange: true,)),
                TicketView(isOrange: true,),
                TicketView(isOrange: true,),
                TicketView(isOrange: true,),

                //listView.builder : use it to build a list of tickets with the data fetched from the API(back-end)
            
        ],
      ),
      )
      
    );
  }
}
