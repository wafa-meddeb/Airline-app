import 'package:airline_app/Screens/bookingScreen/ticket.dart';
import 'package:airline_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/style.dart';
import '../flightsHistScreen/flights_screen.dart';
import '../Profile/ProfileScrren.dart';
import 'package:google_fonts/google_fonts.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime? _departureTime;
  DateTime? _arrivalTime;

Future<void> _selectDateTime(DateTime? dateTime, bool isDeparture) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(dateTime ?? DateTime.now()),
      );
      setState(() {
        if (isDeparture) {
          _departureTime = DateTime(picked.year, picked.month, picked.day,
            pickedTime!.hour, pickedTime.minute);
        } else {
          _arrivalTime = DateTime(picked.year, picked.month, picked.day,
            pickedTime!.hour, pickedTime.minute);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(" What are\nyou looking for? ",style: GoogleFonts.acme(fontSize: 35,color: darkBlue)),
          ), 
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:13.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFF4F6FD)
                ),
                child: Center(child: Text('Airline Tickets', style: Styles.subtitle1Style.copyWith(fontWeight: FontWeight.w600, color: Styles.textColor,fontSize: 17),)),  
                  ),
            ),
          ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
              onTap: () => _selectDateTime(_departureTime, true),
          child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      //offset: Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  children: [
              const Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2D5)),
              Expanded(
                child: Text(
                  _departureTime != null
                      ? DateFormat('dd MMMM yyyy, HH:mm').format(_departureTime!)
                      : ' Departure',
                  style: Styles.textStyle,
                ),
              )
            ],
                ),
              ),
        ),
      ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () => _selectDateTime(_arrivalTime, false),

              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      //offset: Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  children: [
              const Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2D5)),
              Expanded(
                child: Text(
                  _arrivalTime != null
                      ? DateFormat('dd MMMM yyyy, HH:mm').format(_arrivalTime!)
                      : ' Arrival',
                  style: Styles.textStyle,
                ),
              )
            ],
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Upcoming Flights', style: Styles.headline2Style,),
                      InkWell(
                        child: Text('View all', style: Styles.textStyle.copyWith(color: Styles.primaryColor),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Flights()));
                        },
                      )
                    ],
                  ),
                  
                ),
        ),
        const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TicketView(isOrange: true,),
                TicketView(isOrange: true,),
              ],
            )
          ),
          ]
          ),

        )
    );     
  
  }
}