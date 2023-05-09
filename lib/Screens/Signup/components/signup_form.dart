import 'package:airline_app/components/bottom_nav_bar.dart';
import 'package:airline_app/modelView/userAuthModelView.dart';
import 'package:airline_app/models/passenger.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nameController = TextEditingController();
  final _familyNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _passportNumberController = TextEditingController();
  bool _isLoading = false;
  final userViewModel = UserAuthModelView();
    late PassengerModel _passenger;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();


    @override
  void initState() {
    super.initState();
    _passenger = PassengerModel();
  }

  void _handleSignUp() async {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      try {
        final passengerModel = await userViewModel.signUp(_passenger);

        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign-up successful.'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.of(context).pop();
      } catch (e) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign-up failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final name= TextFormField(
      controller: _nameController,
    //onSaved: (String? value) {_name = value;},


              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "First name",
                prefixIcon: Icon(Icons.person,color: darkBlue,),
              
    ),
     validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your first name';
        }
        return null;
      },
  );

  final familyName= TextFormField(
controller: _familyNameController,
    //onSaved: (String? value) {_familyName = value;},
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Last name",
                  prefixIcon: Icon(Icons.person,color: darkBlue,),
                ),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your last name';
        }
        return null;
      },
  );

  final email= TextFormField(
     keyboardType: TextInputType.emailAddress,
     controller: _emailController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              //onSaved: (String? value) {_email=value;},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Icon(Icons.email,color: darkBlue,),
              ),
validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
);


  final phoneNumber= TextFormField(
           keyboardType: TextInputType.phone,
           controller: _phoneNumberController,
   // onSaved: (String? value) {_phoneNumber = value;} ,
                textInputAction: TextInputAction.next,
                 cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  prefixIcon: Icon(Icons.phone,color: darkBlue,),
                ),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
  );

  final nationality= TextFormField(
           controller: _nationalityController,
    //onSaved: (String? value) {_nationality = value;} ,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Nationality",
                    prefixIcon: Icon(Icons.flag,color: darkBlue,),
                  ),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your nationality';
        }
        return null;
      },
  );final passportNumber= TextFormField(
           keyboardType: TextInputType.number,
           controller: _passportNumberController,
    //onSaved: (String? value) {_passportNumber = value;} ,
                textInputAction: TextInputAction.next,
                 cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "passport number",
                  prefixIcon: Icon(Icons.fingerprint,color: darkBlue,),
                ),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your passport number';
        }
        return null;
      },
  );

    return Form(
      key: _keyForm,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: name
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
            child: familyName
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: email
          ),

          Padding(
            padding: const EdgeInsets.symmetric( horizontal: defaultPadding),
            child: phoneNumber
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding),
            child: passportNumber
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: nationality
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(darkBlue),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 2,
                  vertical: defaultPadding / 2)),
            ),
            onPressed: () async {
              if (_keyForm.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });
                
                // Create a new PassengerModel object using the form data
                  final passenger = PassengerModel(
                    name: _nameController.text,
                    familyName: _familyNameController.text,
                    email: _emailController.text,
                    nationality: _nationalityController.text,
                    phoneNumber: _phoneNumberController.text,
                    passportNumber: _passportNumberController.text,
                  );
 try {
                    // Attempt to sign up the user
                    final passengerModel =
                        await userViewModel.signUp(passenger);

                    // If the sign-up process was successful, show a success message
                    // and navigate back to the login view.
                    setState(() {
                      _isLoading = false;
                    });
                  
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBottom())
                    );
                  } catch (e) {
                    // If an error occurs during sign-up, show an error message
                    // and reset the loading state.
                    setState(() {
                      _isLoading = false;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sign up failed. ${e.toString()}'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              },
            child: Text('Sign Up'),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) { //builder: builds the primary contents of the route
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}