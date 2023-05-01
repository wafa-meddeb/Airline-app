
import 'package:flutter/material.dart';

import '../../components/background.dart';
import 'components/login_signup_btn.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(child: SingleChildScrollView(
        child: SafeArea(child: Column(
      children:[
        Image.asset(
                "assets/images/welcome_image2.jpg",
              ),
              SizedBox(height: 100,),
        const Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(), 
            ),
            Spacer(),
          ],
        ),
      ],
    )),
      )),
        );
  }
}