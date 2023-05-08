import 'package:airline_app/components/bottom_nav_bar.dart';
import 'package:airline_app/modelView/userAuthModelView.dart';
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
  String? _name;
  String? _familyName;
  String? _email;
  String? _phoneNumber;
  String? _nationality;
  String? _passportNumber;

   final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

     @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name= TextFormField(
    onSaved: (String? value) {_name = value;},


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

    onSaved: (String? value) {_familyName = value;},
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
     
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (String? value) {_email=value;},
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
    onSaved: (String? value) {_phoneNumber = value;} ,
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
           
    onSaved: (String? value) {_nationality = value;} ,
                textInputAction: TextInputAction.done,
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
    onSaved: (String? value) {_passportNumber = value;} ,
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
            onPressed: () {
               if (_keyForm.currentState!.validate()) {
            _keyForm.currentState!.save();
            
            UserAuthModelView.signUp(_name!, _familyName!, _email!, _phoneNumber!, _nationality!, _passportNumber!, context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {return NavigationBottom();
                }, 
                ), 
                );
            
            }
              
            },
            child: Text("Sign Up".toUpperCase(),),
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