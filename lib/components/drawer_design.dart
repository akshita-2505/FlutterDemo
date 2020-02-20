import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/routes/app_routes.dart';
import 'package:flash_chat/screens/authentication/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerDesign extends StatefulWidget {
  @override
  _DrawerDesignState createState() => _DrawerDesignState();
}

class _DrawerDesignState extends State<DrawerDesign> {
  final _auth = FirebaseAuth.instance;

  void logout(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "ALERT",
      desc: "Are you sure?",
      buttons: [
        DialogButton(
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            _auth.signOut();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();
            AppRoutes.replace(context, WelcomeScreen());
          },
          color: Colors.red,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            AppBar(
              leading: Container(),
              title: Text('Setting'),
              backgroundColor: Colors.red,
              actions: <Widget>[
                Container()
              ],
            ),
            ListTile(
              title: Text('LOGOUT'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
