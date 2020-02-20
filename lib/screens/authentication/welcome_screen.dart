import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/function/LoginChecker.dart';
import 'package:flash_chat/routes/app_routes.dart';
import 'package:flash_chat/routes/bottomNavigation.dart';
import 'package:flash_chat/screens/authentication/login_screen.dart';
import 'package:flash_chat/screens/authentication/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//  Animation animation;
  bool existingLoginState = false;

  checkLoginStatus() async {
    LoginChecker isLogin = LoginChecker();

    var isLoggedIn = await isLogin.isExisting();
    if (isLoggedIn == true) {
      AppRoutes.replace(context, BottomTabBarNavigation());
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
//    controller = AnimationController(
//      duration: Duration(seconds: 1),
//      vsync: this,
//    );
//    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
//    controller.forward();
//
//    controller.addListener(() {
//      setState(() {});
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Hero(
//                  tag: 'logo',
//                  child: Container(
//                    child: Image.asset('images/logo.png'),
//                    height: 60,
//                  ),
//                ),
                TypewriterAnimatedTextKit(
                  text: ['Fashion'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
                colour: Colors.red,
                text: 'Log In',
                onPress: () {
                  AppRoutes.goto(context, LoginScreen());
                }),
            RoundButton(
                colour: Colors.red,
                text: 'Register',
                onPress: () {
                  AppRoutes.goto(context, RegistrationScreen());
                }),
          ],
        ),
      ),
    );
  }
}
