import 'package:airline_app/Screens/bookingScreen/bookingScreen.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/bottom_nav_bar.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget { // a class that extends a stateless widget: it doesn't have any mutable state 
  const LoginForm({ 
    Key? key,  //key is used to uniquely identify widgets in the widget tree: (usefuf for handling updates and performing operations)
  }) : super(key: key); //calls the constructor of the superclass(=StatelessWidget)

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress, //type of keyboard to show the @ sign
            textInputAction: TextInputAction.next,
            cursorColor: darkBlue,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Icon(Icons.person,color: Color(0xFF0F0671)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Icon(Icons.lock,color: Color(0xFF0F0671)),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {return const NavigationBottom();
                }, 
                ), 
                );
              },
              child: Text(
                "Login".toUpperCase(),
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(darkBlue)),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
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
