import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  static const String url = "http://10.0.2.2:8000/api/V1/";
  final String mediaUpload = "http://127.0.0.1:8000/api/V1/media";

  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  postData(data, apiUrl) async {
    final fullurl = url + apiUrl;
    return await http.post(Uri.parse(fullurl),body: jsonEncode(data), headers: setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  
}
