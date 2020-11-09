import 'package:bonk_chat/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/screens/welcome_screen.dart';
import 'package:bonk_chat/screens/login_screen.dart';
import 'package:bonk_chat/screens/registration_screen.dart';
import 'package:bonk_chat/screens/chat_screen.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myLightTheme,
      initialRoute: WelcomeScreen.id,
      // routes: {
      //   WelcomeScreen.id: (context) => WelcomeScreen(),
      //   RegistrationScreen.id: (context) => RegistrationScreen(),
      //   LoginScreen.id: (context) => LoginScreen(),
      //   ChatScreen.id: (context) => ChatScreen(),
      //   MainScreen.id: (context) => MainScreen()
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
              case MainScreen.id:
                return MainScreen();
              case ChatScreen.id:
                return ChatScreen();
              default:
                return null;
            }
          },
          transitionDuration: Duration(milliseconds: 180),
          reverseTransitionDuration: Duration(milliseconds: 180),
          transitionsBuilder: (context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            transitionEffect.createCustomEffect(handle: (Curve curve,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return ScaleTransition(
                scale: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            });
            return effectMap[PageTransitionType.custom](
                Curves.easeOut, animation, secondaryAnimation, child);
          },
        );
      },
    );
  }
}

ThemeData myLightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  primaryColor: Colors.deepPurple[400],
  accentColor: Colors.deepPurple[400],
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.black54),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    contentTextStyle: TextStyle(
      color: Colors.pink[900],
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
  ),
  dialogTheme: DialogTheme(
    contentTextStyle: TextStyle(
      color: Colors.deepPurple[900],
      fontSize: 16,
    ),
    titleTextStyle: TextStyle(
        color: Colors.deepPurple[900],
        fontSize: 20,
        fontWeight: FontWeight.w500),
  ),
);
