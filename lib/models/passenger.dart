class Passenger{
  //int? id;
  String? name;
  String? familyName;
  String? email;
  String? phoneNumber;
  String? Nationality;
  String? passportNumber;

  Passenger({
    //this.id,
    this.name,
    this.familyName,
    this.email,
    this.phoneNumber,
    this.Nationality,
    this.passportNumber,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
        name: json['name'],
        familyName: json['familyName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        Nationality: json['nationality'],
        passportNumber: json['passportNumber']);
  }
}