import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchLogic {

  Future getSearchCityNames (String search) async {
    var url = 'https://voyager.goibibo.com/api/v2/flights_search/find_node_by_name_v2/?v=2';
    url = (search != null || search != '') ? (url += '&search_query=' + search) : (url += '&search_query=ahemadabad');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}