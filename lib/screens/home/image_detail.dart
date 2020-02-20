import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  ImageDetail({this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.red,
        title: const Text('Image'),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: Column(
          children: <Widget>[
            Image.network(imageURL)
          ],
        ),
      ),
    );
  }
}
