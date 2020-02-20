import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  ImageList({this.imageUrl, this.onPressed});

  final String imageUrl;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      onPressed: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}