import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    http.Response uriResponse = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (uriResponse.statusCode == 200) {
      String jsonData = uriResponse.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
