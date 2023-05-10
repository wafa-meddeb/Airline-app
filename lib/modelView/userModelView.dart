import 'dart:convert';
import 'dart:developer';

import 'package:airline_app/Screens/bookingScreen/bookingScreen.dart';
import 'package:airline_app/models/passenger.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; 

class UserAuthModelView {
  static const String baseUrl = "http://10.0.2.2:3000";

  Future<PassengerModel> signUp(PassengerModel passenger) async {
    final response = await http.post(Uri.parse("$baseUrl/passenger/add"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(passenger.toJson())); //to convert the object to json format
        log(response.body.toString());
        log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return PassengerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add passenger.');
    }
  }

  Future<void> saveDataToSharedPreferences(PassengerModel passenger) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', passenger.name!);
  await prefs.setString('familyName', passenger.familyName!);
  await prefs.setString('passportNumber', passenger.passportNumber!);
  await prefs.setString('phoneNumber', passenger.phoneNumber!);
  await prefs.setString('email', passenger.email!);
  await prefs.setString('nationality', passenger.nationality!);
}

Future<PassengerModel> updatePassenger(
      String passportNumber, String fieldName, String fieldValue) async {
    var url = Uri.parse('$baseUrl/update/$passportNumber/$fieldName');
    var response = await http.put(url, headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },body: jsonEncode({"fieldValue":fieldValue}));
    if (response.statusCode == 200) {
      log("updated successfully");
      return PassengerModel.fromJson(jsonDecode(response.body));
    } else {
      // Throw an exception with the HTTP status code and the response body
      throw Exception('Failed to update passenger: ${response.statusCode}, ${response.body}');
    }
  }



}
