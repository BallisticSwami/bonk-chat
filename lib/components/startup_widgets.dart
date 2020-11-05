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
            color: primaryColor, width: SizeConfig.safeBlockHorizontal * 0.8),
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
