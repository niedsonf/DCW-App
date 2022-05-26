import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:getmage/constants/style.dart';
import 'package:getmage/pages/login/widgets/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(children: [
              Text('Login',
                  style: TextStyle(
                      fontSize: 24, color: light, fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Text('Welcome back to DCW',
                  style: TextStyle(
                      fontSize: 18, color: light, fontWeight: FontWeight.w100)),
            ]),
            const SizedBox(height: 30),
            LoginButton(
                icon: FontAwesomeIcons.google,
                color: lightRed,
                text: 'Login with Google'),
          ]),
        ),
      ),
    );
  }
}
