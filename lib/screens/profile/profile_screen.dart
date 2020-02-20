import 'dart:io';

import 'package:flash_chat/components/drawer_design.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _uploadedFileURL;
  bool isLoading = false;
  String email;

  void getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery)
        .then((image) async {
      setState(() {
        isLoading = true;
      });
      var words = image.path.split("/");

      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('$email/profileImage/${words[words.length - 1]}}');
      StorageUploadTask uploadTask = storageReference.putFile(image);

      await uploadTask.onComplete;
      print('File Uploaded');
      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
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
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
        title: Text('Profile'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer())
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                padding: EdgeInsets.all(30.0),
                child: FittedBox(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(_uploadedFileURL != null
                        ? _uploadedFileURL
                        : 'https://via.placeholder.com/150'),
                  ),
                ),
              ),
              Text(
                email != null ? email : '',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: chooseFile,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      endDrawer: DrawerDesign(),
    );
  }
}
