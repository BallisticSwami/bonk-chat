import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/components/startup_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      opacity: 0.35,
      color: Colors.black,
      progressIndicator: CircularProgressIndicator(
        strokeWidth: SizeConfig.safeBlockHorizontal * 1.2,
      ),
      child: Scaffold(
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
                cursorRadius: Radius.circular(20),
                cursorColor: Colors.pink[900],
                style: TextStyle(color: Colors.pink[900]),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
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
                cursorRadius: Radius.circular(20),
                cursorColor: Colors.pink[900],
                style: TextStyle(color: Colors.pink[900]),
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
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
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    newUser.user.sendEmailVerification();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return EmailVerificationDialog(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          );
                        });
                  }

                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
