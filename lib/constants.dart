import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.red,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.red, width: 2.0),
  ),
);

const kTextFieldDecorationStyle = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMapSearchTextFiledDecorationStyle = InputDecoration(
  prefixIcon: Icon(
    Icons.search,
    color: Colors.red,
  ),
  hintText: 'Search City...',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kSearchBarTextField = InputDecoration(
  hintText: 'Search..',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(Radius.elliptical(10.0, 10.0)),
  ),
);

const List<String> imageUrls = [
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
];

List<Widget> icons = [
  Icon(Icons.add, size: 25.0, color: Colors.white,),
  Icon(Icons.arrow_upward, size: 25.0, color: Colors.white,),
  Icon(Icons.account_balance, size: 25.0, color: Colors.white,),
  Icon(Icons.person_outline, size: 25.0, color: Colors.white,),
];
