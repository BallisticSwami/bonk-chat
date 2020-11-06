import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/utilities/size_config.dart';

class PageButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  PageButton({@required this.text, @required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 12),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(SizeConfig.safeBlockHorizontal * 40),
        child: FlatButton(
          color: color,
          onPressed: onPressed,
          child: Container(
              alignment: Alignment.center,
              height: SizeConfig.safeBlockVertical * 5.7,
              child: Text('$text')),
        ),
      ),
    );
  }
}

class MyTextFieldInputDecoration {
  InputDecoration getInputDecoration(
      {String hintText,
      Color primaryColor,
      Color secondaryColor,
      Color textColor}) {
    return InputDecoration(
      hintText: '$hintText',
      hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 1.5,
          horizontal: SizeConfig.safeBlockHorizontal * 4.6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(200)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: secondaryColor, width: SizeConfig.safeBlockHorizontal * 0.5),
        borderRadius: BorderRadius.all(Radius.circular(200)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: primaryColor, width: SizeConfig.safeBlockHorizontal * 0.55),
        borderRadius: BorderRadius.all(Radius.circular(200)),
      ),
    );
  }
}

class EmailVerificationDialog extends StatelessWidget {
  EmailVerificationDialog({this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Email Verification Sent'),
      content: Text(
          'Please check your inbox to verify your account and Log In with your email and password'),
      actions: [FlatButton(onPressed: onPressed, child: Text('OK'))],
    );
  }
}

class EmailNotVerifiedDialog extends StatelessWidget {
  EmailNotVerifiedDialog({this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Email Not Verified'),
      content: Text(
          'Your account has not been verified.\nPlease check your inbox to verify your account.'),
      actions: [FlatButton(onPressed: onPressed, child: Text('OK'))],
    );
  }
}

class ErrorHandling {
  static void showErrorSnackbar(FirebaseAuthException e, BuildContext context) {
    SnackBar mySnackBar;

    if (e.code == 'unknown') {
      mySnackBar = SnackBar(
        content: Text(
          'Please check your internet connection',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      mySnackBar = SnackBar(
        content: Text(
          '${e.message}',
          textAlign: TextAlign.center,
        ),
      );
    }
    Scaffold.of(context).showSnackBar(mySnackBar);
  }

  static void showAssErrorSnackbar(AssertionError e, BuildContext context) {
    SnackBar mySnackBar;

    mySnackBar = SnackBar(
      content: Text(
        'Please enter correct email and/or password',
        textAlign: TextAlign.center,
      ),
    );
    Scaffold.of(context).showSnackBar(mySnackBar);
  }
}

class ResetPasswordButton extends StatefulWidget {
  @override
  _ResetPasswordButtonState createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  final _auth = FirebaseAuth.instance;
  String email;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 2.5,
          vertical: SizeConfig.safeBlockVertical),
      textColor: Colors.deepPurple[700].withOpacity(0.4),
      borderSide: BorderSide(color: Colors.deepPurple[200].withOpacity(0.3)),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Reset Password'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      cursorRadius: Radius.circular(20),
                      cursorColor: Colors.deepPurple[900],
                      style: TextStyle(color: Colors.deepPurple[900]),
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: MyTextFieldInputDecoration()
                          .getInputDecoration(
                              hintText: 'Enter your email',
                              primaryColor: Colors.deepPurple[400],
                              secondaryColor: Colors.deepPurple[100],
                              textColor: Colors.deepPurple[900]),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Text(
                        'Do you want to send reset password link to your email?'),
                  ],
                ),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        try {
                          _auth.sendPasswordResetEmail(email: email);
                        }
                        catch (e) {
                          print(e);
                        }
                      },
                      child: Text('Yes'))
                ],
              );
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.settings_backup_restore),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal,
          ),
          Text('Reset Password'),
        ],
      ),
    );
  }
}
