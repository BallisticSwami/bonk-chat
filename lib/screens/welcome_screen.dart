import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                ),
                Text(
                  'Bonk Chat',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 40),
                child: FlatButton(
                  color: Colors.deepPurple[400],
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.id);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: SizeConfig.safeBlockVertical * 5.7,
                      child: Text('Log In')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 40),
                child: FlatButton(
                  color: Colors.pinkAccent[700],
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegistrationScreen.id);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: SizeConfig.safeBlockVertical * 5.7,
                      child: Text('Register')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
