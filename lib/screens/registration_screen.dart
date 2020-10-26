import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';

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
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.pink[900].withOpacity(0.5)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1.5,
                    horizontal: SizeConfig.safeBlockHorizontal * 4.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink[200],
                      width: SizeConfig.safeBlockHorizontal * 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pinkAccent[700],
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
                hintStyle: TextStyle(color: Colors.pink[900].withOpacity(0.5)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1.5,
                    horizontal: SizeConfig.safeBlockHorizontal * 4.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink[200],
                      width: SizeConfig.safeBlockHorizontal * 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pinkAccent[700],
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
                color: Colors.pinkAccent[700],
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
