import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/routes/app_routes.dart';
import 'package:flash_chat/routes/bottomNavigation.dart';
import 'package:flash_chat/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String email;
  String password;
  bool showSpinner = false;

  navigateToScreen() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final user = await _auth.currentUser();
      if (user != null) {
          loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }

    await prefs.setBool('loginExist', true);
    await prefs.setString('email', loggedInUser.email);
    AppRoutes.goto(context, BottomTabBarNavigation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecorationStyle.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecorationStyle.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                  colour: Colors.red,
                  text: 'Log In',
                  onPress: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      final login = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(login != null){
                        navigateToScreen();
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      print(e);
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "ALERT",
                        desc: "Please enter valid email and password",
                        buttons: [
                          DialogButton(
                            child: Text(
                              'Ok',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.red,
                          )
                        ],
                      ).show();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
