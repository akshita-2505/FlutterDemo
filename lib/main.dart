import 'package:flash_chat/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/authentication/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          routes: routes
      );
  }
}
