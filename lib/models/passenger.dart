class Passenger{
  int? id;
  String? name;
  String? familyName;
  String? email;
  String? phoneNumber;
  String? nationality;
  String? passportNumber;

  Passenger({
    this.id,
    this.name,
    this.familyName,
    this.email,
    this.phoneNumber,
    this.nationality,
    this.passportNumber,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
        name: json['name'],
        familyName: json['familyName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        nationality: json['nationality'],
        passportNumber: json['passportNumber']);
  }
}