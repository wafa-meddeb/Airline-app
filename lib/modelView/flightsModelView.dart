import 'dart:convert';
import 'package:airline_app/models/flight.dart';
import 'package:http/http.dart' as http;


class FlightsModelView {
  final String baseUrl = "http://localhost:8080/flight/getFlight"; // the API endpoint

  // method to fetch a list of flights from the API
  Future<List<Flight>> getFlights() async {
    final response = await http.get(Uri.parse('$baseUrl/flights'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final flights = data.map((flight) => Flight.fromJson(flight)).toList();
      return flights;
    } else {
      throw Exception('Failed to load flights');
    }
  }

  
}
