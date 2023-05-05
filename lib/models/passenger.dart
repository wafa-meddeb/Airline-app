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
  
  // Setters
  set passengerId(int? id) => this.id = id;
  set passengerName(String? name) => this.name = name;
  set passengerFamilyName(String? familyName) => this.familyName = familyName;
  set passengerEmail(String? email) => this.email = email;
  set passengerPhoneNumber(String? phoneNumber) => this.phoneNumber = phoneNumber;
  set passengerNationality(String? nationality) => this.nationality = nationality;
  set passengerPassportNumber(String? passportNumber) => this.passportNumber = passportNumber;

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