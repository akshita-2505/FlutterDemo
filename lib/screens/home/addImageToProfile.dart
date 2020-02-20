import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AddImageToProfile extends StatefulWidget {

  @override
  _AddImageToProfileState createState() => _AddImageToProfileState();
}

class _AddImageToProfileState extends State<AddImageToProfile> {
  bool isLoading = false;
  String email;

  void getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    fetchData();
  }

  fetchData() async {
    var document = await FirebaseStorage.instance.ref().child('$email/post/16:19:18.png').getDownloadURL();


  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) async {
      setState(() {
        isLoading = true;
      });

      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('$email/post/${new DateFormat().format(new DateTime.now())}.png');
      StorageUploadTask uploadTask = storageReference.putFile(image);

      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.red,
        title: const Text('Add Image'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 0.0),
            child: FlatButton(
              onPressed: chooseFile,
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
