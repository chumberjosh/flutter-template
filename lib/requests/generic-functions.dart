import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../requests/http.dart' as requests;
import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:5000/api/";
const username = "jxchumber";

Future<dynamic> login({username, password}) async {
  var loginInfo =
      jsonEncode(<String, String>{'username': username, 'password': password});
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final response =
      await requests.post(url: 'auth/login', data: loginInfo, headers: headers);

  if (response != 'error') {
    return response;
  } else {
    return 'error';
  }
}

Future<void> showModal(context, item) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: 200,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text('Modal')],
          ),
        ),
      );
    },
  );
}
