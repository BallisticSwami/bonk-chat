import 'dart:math';
import 'package:bonk_chat/screens/login_screen.dart';
import 'package:bonk_chat/screens/main_screen.dart';
import 'package:bonk_chat/screens/registration_screen.dart';
import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/components/startup_widgets.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController bonkController;
  Animation animation;
  Animation bonkAnimation;

  Animation<double> rot;
  Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 1400),
      vsync: this,
    );

    bonkController = AnimationController(
      duration: Duration(milliseconds: 140),
      vsync: this,
    );

    rot = Tween<double>(
      begin: 1.8 * pi,
      end: 2 * pi,
    ).animate(bonkController);

    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    bonkAnimation =
        CurvedAnimation(parent: bonkController, curve: Curves.easeOutBack);

    controller.forward();
    Future.delayed(Duration(milliseconds: 420), () {
      bonkController.forward();
    });

    bonkController.addListener(() {
      setState(() {});
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    bonkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
          child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width:
                        animation.value * SizeConfig.safeBlockHorizontal * 70,
                    child: Image.asset(
                      'assets/images/bonk_chat_t.png',
                    ),
                  ),
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      width:
                          animation.value * SizeConfig.safeBlockHorizontal * 70,
                      child: Transform.rotate(
                        alignment: Alignment.centerLeft,
                        angle: rot.value,
                        child: Image.asset(
                          'assets/images/bonk_chat_b.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            ),
            PageButton(
                text: 'LOG IN',
                color: Colors.deepPurple[400],
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.id);
                }),
            PageButton(
              text: 'REGISTER',
              color: Colors.pinkAccent[700],
              onPressed: () {
                Navigator.of(context).pushNamed(MainScreen.id);
                // Navigator.of(context).pushNamed(RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
