import 'package:flutter/material.dart';

class SearchListItems extends StatelessWidget {
  SearchListItems({this.airportCode, this.airportName, this.cityName, this.onPressed});

  final String airportName;
  final String airportCode;
  final String cityName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(5.0, 5.0)),
        color: Colors.grey[300],
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      cityName,
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      airportCode,
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Text(
                airportName,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black54, fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
