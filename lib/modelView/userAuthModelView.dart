import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class userAuthModelView {
  static const String baseUrl = "api.example.com";

  // method to sign up a user using the API and show a dialog box to the user based on the response from the API 
  static Future<void> signUp(  
      String name,
      String familyName,
      String email,
      String phoneNumber,
      String nationality,
      String passportNumber,
      String password,
      BuildContext context) async {
    Map<String, dynamic> userData = {  // create a map of the user data
      "name": name,
      "familyName": familyName,
      "email": email,
      "phoneNumber": phoneNumber,
      "nationality": nationality,
      "passportNumber": passportNumber,
      "password": password,
    };

    Map<String, String> headers = {  // create a map of the headers : content-type
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .post(Uri.http(baseUrl, "/passengers"), 
            body: json.encode(userData), headers: headers)  // encode the data to json and send it to the API
        .then((http.Response response) async {
      if (response.statusCode == 201) {   // 201 is the status code for created
        Navigator.pushNamed(context, "/login");
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign up successful",
                      style: TextStyle(color: Colors.green)),
                  content:
                      Text("Please check your mail to verify your account"));
            });
      } else if (response.statusCode == 409) {  // 409 is the status code for conflict
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign up failed",
                      style: TextStyle(color: Colors.red)),
                  content:
                      Text("Account already exists please use another email"));
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Network error",
                      style: TextStyle(color: Colors.red)),
                  content: Text(
                      "Please check your internet connection and try again!"));
            });
      }
    });
  }
}
