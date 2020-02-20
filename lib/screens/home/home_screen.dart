import 'package:flash_chat/components/image_grid.dart';
import 'package:flash_chat/components/search_container.dart';
import 'package:flash_chat/logics/search_logic.dart';
import 'package:flash_chat/routes/app_routes.dart';
import 'package:flash_chat/screens/home/addImageToProfile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    SearchLogic().getSearchCityNames('surat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.red,
        title: const Text('Home'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 0.0),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                });
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: isSearch
            ? SearchContainer()
            : Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Money Transfers',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ImageGrid()
                  ],
                ),
              ),
      ),
      floatingActionButton: !isSearch ? FloatingActionButton(
        onPressed: () {
          AppRoutes.goto(context, AddImageToProfile());
        },
        backgroundColor: Colors.red,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ) : null,
    );
  }
}
