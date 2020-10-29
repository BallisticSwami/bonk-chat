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
