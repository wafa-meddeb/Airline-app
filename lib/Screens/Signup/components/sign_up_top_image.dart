import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/welcome_image.png"),
            ),
            //const Spacer(),
          ],
        ),
        //SizedBox(height: defaultPadding),
      ],
    );
  }
}
