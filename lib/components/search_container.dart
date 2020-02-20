import 'package:flash_chat/components/serach_city_list.dart';
import 'package:flash_chat/logics/search_logic.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  var city;
  String searchCity;
  List<dynamic> airportName = [];
  List<dynamic> airportCode = [];
  List<dynamic> cityName = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: kSearchBarTextField,
              cursorColor: Colors.red,
              initialValue: searchCity,
              onChanged: (newValue) async {
                SearchLogic searchLogic = SearchLogic();
                var tempCity = await searchLogic.getSearchCityNames(newValue);
                var tempAirportName = [];
                var tempCityName = [];
                var tempAirportCode = [];
                for (var s in tempCity['data']['r']) {
                  tempAirportName.add(s['n']);
                  tempCityName.add(s['ct']['n']);
                  tempAirportCode.add(s['iata']);
                }
                setState(
                  () {
                    airportName = tempAirportName;
                    cityName = tempCityName;
                    airportCode = tempAirportCode;
                    searchCity = newValue;
                  },
                );
              },
            ),
          ),
          listUI()
        ],
      ),
    );
  }

  listUI() {
    return Container(
      height: 645,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: List.generate(
            cityName.length,
            (index) {
              return SearchListItems(
                airportCode: airportCode[index],
                airportName: airportName[index],
                cityName: cityName[index],
                onPressed: () {
                  print(cityName[index]);
                  setState(() {
                    searchCity = cityName[index];
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
