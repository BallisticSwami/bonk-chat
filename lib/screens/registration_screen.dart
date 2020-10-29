import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/components/startup_widgets.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            padding:
                EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 75,
                  child: Image.asset(
                    'assets/images/register_t.png',
                  ),
                ),
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 75,
                    child: Image.asset(
                      'assets/images/register_b.png',
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
                  primaryColor: Colors.pinkAccent[700],
                  secondaryColor: Colors.pink[200],
                  textColor: Colors.pink[900]),
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
                  primaryColor: Colors.pinkAccent[700],
                  secondaryColor: Colors.pink[200],
                  textColor: Colors.pink[900]),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 3,
          ),
          PageButton(
            text: 'CONTINUE',
            color: Colors.pinkAccent[700],
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
