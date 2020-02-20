import 'package:flash_chat/components/image_list.dart';
import 'package:flash_chat/routes/app_routes.dart';
import 'package:flash_chat/screens/home/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../constants.dart';

class ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          icons.length,
          (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    maxRadius: 30.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: icons[index],
                    ),
                  ),
                ),
                Text(
                  'To Account',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/*child: GridView.count(
primary: false,
padding: const EdgeInsets.all(10),
crossAxisSpacing: 10,
mainAxisSpacing: 10,
crossAxisCount: 4,
children: List.generate(
  icons.length,
      (index) {
    return icons[index];
  },
),
            ),*/
