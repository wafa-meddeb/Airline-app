import 'dart:convert';
import 'dart:developer';

import 'package:airline_app/Screens/bookingScreen/bookingScreen.dart';
import 'package:airline_app/models/passenger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserAuthModelView {
  static const String baseUrl = "http://10.0.2.2:8080/passenger/add";

  // method to sign up a user using the API and show a dialog box to the user based on the response from the API 
  // static Future<void> signUp(  
  //     //int? id,
  //     String name,
  //     String familyName,
  //     String email,
  //     String phoneNumber,
  //     String nationality,
  //     String passportNumber,
  //     BuildContext context) async {
  //   Map<String, dynamic> userData = {  // create a map of the user data
  //     "name": name,
  //     "familyName": familyName,
  //     "email": email,
  //     "phoneNumber": phoneNumber,
  //     "nationality": nationality,
  //     "passportNumber": passportNumber,
      
  //   };

  //   Map<String, String> headers = {  // create a map of the headers : content-type
  //     "Content-Type": "application/json; charset=UTF-8"
  //   };

  //   http
  //       .post(Uri.parse(baseUrl), 
  //           body: json.encode(userData), headers: headers)  // encode the data to json and send it to the API
  //       .then((http.Response response) async {
  //         print("response body:" + "$response.body");
  //     if (response.statusCode == 200) {   // 200 is the status code for OK
  //       Navigator.push(context,MaterialPageRoute(builder: (context) { //builder: builds the primary contents of the route
  //                   return Booking();
  //                 },)); //
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return const AlertDialog(
  //                 title: Text("Sign up successful",
  //                     style: TextStyle(color: Colors.green)),
  //                 content:
  //                     Text("Please check your mail to verify your account"));
  //           });
  //     } else if (response.statusCode == 409) {  // 409 is the status code for conflict
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return const AlertDialog(
  //                 title: Text("Sign up failed",
  //                     style: TextStyle(color: Colors.red)),
  //                 content:
  //                     Text("Account already exists please use another email"));
  //           });
  //     } else {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return const AlertDialog(
  //                 title: Text("Network error",
  //                     style: TextStyle(color: Colors.red)),
  //                 content: Text(
  //                     "Please check your internet connection and try again!"));
  //           });
  //     }
  //   });
  // }

  Future<PassengerModel> signUp(PassengerModel passenger) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(passenger.toJson()));
        log(response.body.toString());
        log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return PassengerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add passenger.');
    }
  }

}
