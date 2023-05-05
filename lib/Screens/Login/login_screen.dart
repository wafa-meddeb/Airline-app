import 'package:flutter/material.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold is a widget that contains the AppBar and the body of the screen
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.only(left:12.0,top: 12,right: 12),
              child: Image.asset("assets/images/login.jpg"),
            ),
            const Row(
              children:  [
                Spacer(),
                Expanded(
                  flex: 8, // takes 80% of the screen
                  child: LoginForm(),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
}}
