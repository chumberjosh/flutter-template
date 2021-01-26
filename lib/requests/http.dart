import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const baseUrl = "http://10.0.2.2:5000/api/";

var headers = {
  HttpHeaders.authorizationHeader:
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwidW5pcXVlX25hbWUiOiJqeGNodW1iZXIiLCJuYmYiOjE2MDY5MTg3MjgsImV4cCI6MTYzODQ1NDcyOCwiaWF0IjoxNjA2OTE4NzI4fQ.C-4uqON8_YnHfp45XoAMkZbgjt984AYT9I5Zffp-F0cCJTCARiyvXxgrS2iQEBV9erGAb-KBYdMN_HyfihRhfQ"
};

Future<dynamic> get({url}) async {
  print(baseUrl + url);
  final response = await http.get(baseUrl + url, headers: headers);
  print(response.statusCode);

  if (response.statusCode == 200) {
    dynamic res = json.decode(response.body);
    return res;
  } else {
    print(response);
    throw Exception('Failed to get data');
  }
}

Future<dynamic> getList({url}) async {
  print(headers);
  final response = await http.get(baseUrl + url, headers: headers);
  print(response.statusCode);

  if (response.statusCode == 200) {
    dynamic res = response.body;
    return res;
  } else {
    throw Exception('Failed to get data');
  }
}

Future<dynamic> put({url}) async {
  final response = await http.put(baseUrl + url);
  print(response.statusCode);

  if (response.statusCode == 200) {
    dynamic res = json.decode(response.body);
    return res;
  } else {
    throw Exception('Failed to put data');
  }
}

Future<dynamic> post({String url, dynamic data, dynamic headers}) async {
  final response = await http.post(baseUrl + url, body: data, headers: headers);
  print(response.statusCode);
  if (response.statusCode == 200) {
    dynamic res = json.decode(response.body);
    return res;
  } else {
    return 'error';
  }
}

Future<dynamic> getMockList({url}) async {
  print(headers);
  final response = await http.get(url);
  print(response.statusCode);

  if (response.statusCode == 200) {
    dynamic res = response.body;
    return res;
  } else {
    throw Exception('Failed to get data');
  }
}
