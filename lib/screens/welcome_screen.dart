import 'dart:math';
import 'package:bonk_chat/screens/login_screen.dart';
import 'package:bonk_chat/screens/registration_screen.dart';
import 'package:bonk_chat/utilities/size_config.dart';
import 'package:flutter/material.dart';

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
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    bonkController = AnimationController(
      duration: Duration(milliseconds: 140),
      vsync: this,
    );

    rot = Tween<double>(
      begin: 1.8* pi,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                  width: animation.value * SizeConfig.safeBlockHorizontal * 70,
                  child: Image.asset(
                    'assets/images/bonk_chat_t.png',
                  ),
                ),
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    width: animation.value * SizeConfig.safeBlockHorizontal * 70,
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
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 2,
                horizontal: SizeConfig.safeBlockHorizontal * 12),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 40),
              child: FlatButton(
                color: Colors.deepPurple[400],
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.id);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.safeBlockVertical * 5.7,
                    child: Text('LOG IN')),
              ),
            ),
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
                onPressed: () {
                  Navigator.of(context).pushNamed(RegistrationScreen.id);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.safeBlockVertical * 5.7,
                    child: Text('REGISTER')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
