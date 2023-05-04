import 'dart:convert';
import 'package:airline_app/models/flight.dart';
import 'package:http/http.dart' as http;


class FlightsModelView {
  final String baseUrl = "https://example.com/api/endpoint"; // change this to the actual API endpoint

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

  // method to update a flight using the API
  // Future<void> updateFlight(String flightId, Flight updatedFlight) async {
  //   final response = await http.put(
  //     Uri.parse('$baseUrl/flights/$flightId'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(updatedFlight.toJson()),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to update flight');
  //   }
  // }
}
