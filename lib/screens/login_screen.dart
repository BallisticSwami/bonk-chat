import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/components/startup_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 9),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 62,
                  child: Image.asset(
                    'assets/images/log_in_t.png',
                  ),
                ),
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 62,
                    child: Image.asset(
                      'assets/images/log_in_b.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5.2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 12),
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: MyTextFieldInputDecoration().getInputDecoration(
                hintText: 'Enter your email',
                primaryColor: Colors.deepPurple[400],
                secondaryColor: Colors.deepPurple[100],
                textColor: Colors.deepPurple[900]
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 12),
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              obscureText: true,
              decoration: MyTextFieldInputDecoration().getInputDecoration(
                hintText: 'Enter your password',
                primaryColor: Colors.deepPurple[400],
                secondaryColor: Colors.deepPurple[100],
                textColor: Colors.deepPurple[900]
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 3,
          ),
          PageButton(
            text: 'CONTINUE',
            color: Colors.deepPurple[400],
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

