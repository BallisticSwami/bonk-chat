import 'package:flutter/material.dart';
import 'package:bonk_chat/screens/welcome_screen.dart';
import 'package:bonk_chat/screens/login_screen.dart';
import 'package:bonk_chat/screens/registration_screen.dart';
import 'package:bonk_chat/screens/chat_screen.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter/services.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      theme: myLightTheme,
      initialRoute: WelcomeScreen.id,
      // routes: {
      //   WelcomeScreen.id: (context) => WelcomeScreen(),
      //   RegistrationScreen.id: (context) => RegistrationScreen(),
      //   LoginScreen.id: (context) => LoginScreen(),
      //   ChatScreen.id: (context) => ChatScreen()
      // },
      onGenerateRoute: (routeSettings) {
        return PageRouteBuilder<dynamic>(
            settings: routeSettings,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              switch (routeSettings.name) {
                case WelcomeScreen.id:
                  return WelcomeScreen();
                case LoginScreen.id:
                  return LoginScreen();
                case RegistrationScreen.id:
                  return RegistrationScreen();
                case ChatScreen.id:
                  return ChatScreen();
                default:
                  return null;
              }
            },
            transitionDuration: Duration(milliseconds: 200),
            reverseTransitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return effectMap[PageTransitionType.slideLeft](
                  Curves.easeOut, animation, secondaryAnimation, child);
            });
      },
    );
  }
}

ThemeData myLightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.deepPurple[400],
  accentColor: Colors.deepPurple[400],
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.black54),
    subtitle1: TextStyle(color: Colors.purple[900]),
  ),
);
