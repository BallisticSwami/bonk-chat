import 'package:flash_chat/utilities/size_config.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
                          child: Container(
                height: SizeConfig.safeBlockVertical * 22,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5.2,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
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
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password.',
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
            SizedBox(
              height: SizeConfig.safeBlockVertical*3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical*2),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 40),
                child: FlatButton(
                  color: Colors.pinkAccent[700],
                  onPressed: () {
                    
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
