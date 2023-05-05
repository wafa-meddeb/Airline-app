import 'package:airline_app/models/flight_status.dart';

class Flight {
  int? flightNum;
  String? name;
  DateTime? departureDateTime;
  DateTime? arrivalDateTime;
  double? price;
  double? duration;
  int? distance;
  bool? isDirect; 
  FlightStatus? status;


  Flight({
    this.flightNum,
    this.name,
    this.departureDateTime,
    this.arrivalDateTime,
    this.price,
    this.duration,
    this.distance,
    this.isDirect,
    this.status,
  });

  // Getters 
  int? get flightNumber => flightNum;
  String? get flightName => name;
  DateTime? get flightDepartureDateTime => departureDateTime;
  DateTime? get flightArrivalDateTime => arrivalDateTime;
  double? get flightPrice => price;
  double? get flightDuration => duration;
  int? get flightDistance => distance;
  bool? get flightIsDirect => isDirect;
  FlightStatus? get flightStatus => status;

    
  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
        flightNum: json['flightNum'],
        name: json['name'],
        departureDateTime: json['departureDateTime'],
        arrivalDateTime: json['arrivalDateTime'],
        price: json['price'],
        duration: json['duration'],
        distance: json['distance'],
        isDirect: json['isDirect']);
  }
}