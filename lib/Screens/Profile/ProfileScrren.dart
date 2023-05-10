import 'package:airline_app/Screens/Login/login_screen.dart';
import 'package:airline_app/modelView/userModelView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget  {
  const Profile({super.key});   //constructor of the profile screen

  @override
  State<Profile> createState() => _ProfileState();  //to create the state of the profile screen
}

class _ProfileState extends State<Profile> {

  final UserAuthModelView userViewModel = UserAuthModelView();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

   @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    nameController.dispose();
    familyNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passportNumberController.dispose();
    nationalityController.dispose();
    super.dispose();
  }

  void _updatePassenger() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Get passport number from shared preferences
    final passportNumber = prefs.getString('passportNumber');

    // For each field, update the passenger if the field's value has changed
    if (nameController.text.isNotEmpty) {
      await userViewModel.updatePassenger(passportNumber!, 'name', nameController.text);
    }
    if (familyNameController.text.isNotEmpty) {
      await userViewModel.updatePassenger(passportNumber!, 'familyname', familyNameController.text);
    }
    if (emailController.text.isNotEmpty) {
      await userViewModel.updatePassenger(passportNumber!, 'email', emailController.text);
    }
    if (phoneNumberController.text.isNotEmpty) {
      await userViewModel.updatePassenger(passportNumber!, 'phonenumber', phoneNumberController.text);
    }
    if (nationalityController.text.isNotEmpty) {
      await userViewModel.updatePassenger(passportNumber!, 'nationality', nationalityController.text);
    }
    // Do not allow to change passportNumber since it's used as an identifier in the backend
  }


  @override
  Widget build(BuildContext context) {

    return  FutureBuilder<SharedPreferences>(  //future builder is used to get the data from the shared preferences
      future: SharedPreferences.getInstance(),  //to get the instance of the shared preferences 
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        final prefs = snapshot.data!;  //snapshot.data is used to get the data from the shared preferences
        return Scaffold( //scaffold is the main widget that contains the appbar and the body
        appBar: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
        body: 
    
        SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Padding(
               padding: const EdgeInsets.all(35),
               child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: const Icon(Icons.person, size: 100, color: Colors.grey,),
                       ),
             ),
            Padding(
              padding: const EdgeInsets.all(12), //edgeinsets is used to add padding to the textformfield
              child: TextFormField(
                controller: nameController,
                     decoration:  InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: prefs.getString('name') ?? 'Name', // to get the value of the name from the shared preferences
                                                                  // "??" is used to check if the value is null or not: 
                                                                  //if it is null, it will return the value after "??"
                    ),
            ),),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller:familyNameController ,
                       decoration:  InputDecoration( //decoration is used to add the icon and the label text to the textformfield
                      icon: Icon(Icons.person),
                      labelText:  prefs.getString('familyName') ?? 'Family name ',
                    ),)
                      ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: emailController,
                       decoration:  InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: prefs.getString('email') ?? 'email address',
                    ),
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller:phoneNumberController ,
                       decoration:  InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: prefs.getString('phoneNumber') ?? 'Phone number',
                    ),
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: passportNumberController,
                       decoration:  InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: prefs.getString('passportNumber') ?? 'passport number *',
                    ),
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: nationalityController,
                       decoration:  InputDecoration(
                      icon: Icon(Icons.flag),
                      labelText: prefs.getString('nationality') ?? 'Nationality',
                    ),
                      ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      _updatePassenger();
                    },
                    child: const Text("Edit Profile"),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
                    },
                    child: const Text("Log out"),
                  ),
                ),
              ),
          ],
        ),
        ),
      );
      }
    ); 
  }
}