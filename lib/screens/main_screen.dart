import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light),
          child: Scaffold(
            body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.deepPurpleAccent,
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 40,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 9),
                      topRight:
                          Radius.circular(SizeConfig.safeBlockHorizontal * 9)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
