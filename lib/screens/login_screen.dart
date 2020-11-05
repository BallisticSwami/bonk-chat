import 'package:bonk_chat/screens/chat_screen.dart';
import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/components/startup_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AnimationController controller;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      opacity: 0,
      color: Colors.black,
      progressIndicator: Padding(
        padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 55),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple[400]),
          strokeWidth: SizeConfig.safeBlockHorizontal * 1.2,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 9),
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
                  cursorRadius: Radius.circular(20),
                  cursorColor: Colors.deepPurple[900],
                  style: TextStyle(color: Colors.deepPurple[900]),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: MyTextFieldInputDecoration().getInputDecoration(
                      hintText: 'Enter your email',
                      primaryColor: Colors.deepPurple[400],
                      secondaryColor: Colors.deepPurple[100],
                      textColor: Colors.deepPurple[900]),
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
                  cursorColor: Colors.deepPurple[900],
                  style: TextStyle(color: Colors.deepPurple[900]),
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: MyTextFieldInputDecoration().getInputDecoration(
                      hintText: 'Enter your password',
                      primaryColor: Colors.deepPurple[400],
                      secondaryColor: Colors.deepPurple[100],
                      textColor: Colors.deepPurple[900]),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              PageButton(
                text: 'CONTINUE',
                color: Colors.deepPurple[400],
                onPressed: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    final oldUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (oldUser != null) {
                      if (!oldUser.user.emailVerified) {
                        setState(() {
                          showSpinner = false;
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return EmailNotVerifiedDialog(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                      } else {
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.of(context).pushNamed(ChatScreen.id);
                      }
                    }
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    ErrorHandling.showErrorSnackbar(e, context);
                  } on AssertionError catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    ErrorHandling.showAssErrorSnackbar(e, context);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
