import 'package:flutter/material.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
import 'components/socal_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(
  body:   SingleChildScrollView(
    child: Column(
    
          mainAxisAlignment: MainAxisAlignment.center,
    
          children: [
    
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset("assets/images/welcome_image.png"),
            ),
    
            Row(
    
              children: const [
    
                
  
                Expanded(
    
                  flex: 8,
    
                  child: SignUpForm(),
    
                ),
    
                
    
              ],
    
            ),
    
             const SocalSignUp()
    
          ],
    
        ),
  ),
);
  }
}


