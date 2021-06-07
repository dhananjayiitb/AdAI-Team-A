import 'dart:convert';

import 'package:adai/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> getTemplates(String token) async{
  String finalToken = 'Token '+token;
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/get_posters/'),
    headers: <String, String>{
      'Authorization':finalToken,
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));
    var num=response.body.length;
    List l1=[];
    print(response.body);
    return l1;

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}