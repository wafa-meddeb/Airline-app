import 'package:airline_app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../bookingScreen/bookingScreen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "First name",
                prefixIcon: Icon(Icons.person,color: darkBlue,),
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Last name",
                  prefixIcon: Icon(Icons.person,color: darkBlue,),
                ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Icon(Icons.email,color: darkBlue,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Icon(Icons.lock,color: darkBlue,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: defaultPadding),
            child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  prefixIcon: Icon(Icons.phone,color: darkBlue,),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding),
            child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "passport number",
                  prefixIcon: Icon(Icons.fingerprint,color: darkBlue,),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Nationality",
                    prefixIcon: Icon(Icons.flag,color: darkBlue,),
                  ),
                ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {return NavigationBottom();
                }, 
                ), 
                );
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
                  builder: (context) {
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