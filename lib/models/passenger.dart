class PassengerModel {
  int? id;
  String? name;
  String? familyName;
  String? email;
  String? phoneNumber;
  String? nationality;
  String? passportNumber;
 // Null? passengerBookings;

  PassengerModel(
      {this.id,
      this.name,
      this.familyName,
      this.email,
      this.phoneNumber,
      this.nationality,
      this.passportNumber,
      });

  PassengerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    familyName = json['familyName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    nationality = json['nationality'];
    passportNumber = json['passportNumber'];
    //passengerBookings = json['passengerBookings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['familyName'] = this.familyName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['nationality'] = this.nationality;
    data['passportNumber'] = this.passportNumber;
   // data['passengerBookings'] = this.passengerBookings;
    return data;
  }
}
