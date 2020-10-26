import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';

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
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.deepPurple[900].withOpacity(0.6)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1.5,
                    horizontal: SizeConfig.safeBlockHorizontal * 4.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.deepPurple[100],
                      width: SizeConfig.safeBlockHorizontal * 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.deepPurple[400],
                      width: SizeConfig.safeBlockHorizontal * 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
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
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                hintStyle: TextStyle(color: Colors.deepPurple[900].withOpacity(0.6)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1.5,
                    horizontal: SizeConfig.safeBlockHorizontal * 4.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.deepPurple[100],
                      width: SizeConfig.safeBlockHorizontal * 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.deepPurple[400],
                      width: SizeConfig.safeBlockHorizontal * 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 2,
                horizontal: SizeConfig.safeBlockHorizontal * 12),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 40),
              child: FlatButton(
                color: Colors.deepPurple[400],
                onPressed: () {},
                child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.safeBlockVertical * 5.7,
                    child: Text('CONTINUE')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
