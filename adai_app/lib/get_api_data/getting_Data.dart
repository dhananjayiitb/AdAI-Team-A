import 'dart:convert';
import 'dart:ffi';

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
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<void> putUserDetails(String token,String phone, String fname, String business, String businessNumber, String businessAddress, String businessType) async{
  String finalToken = 'Token '+token;
 var response = await http.post(
   Uri.http('13.233.224.41:8000', 'put_user_details/'),
   headers: <String, String>{
     'Authorization':finalToken,
   },
   body:
 ) ;
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> getUserDetails(String token,String phoneNumber) async{
  String finalToken = 'Token '+token;
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'get_user_details/'),
      headers: <String, String>{
        'Authorization':finalToken,
      },
      body:
  ) ;
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<void> updateUserDetails(String token,String phone, String fname, String business, String businessNumber, String businessAddress, String businessType) async{
  String finalToken = 'Token '+token;
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'update_user_details/'),
      headers: <String, String>{
        'Authorization':finalToken,
      },
      body:
  ) ;
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<void> putCustomer(String token,String userPhone,String name,String contact) async{
  String finalToken = 'Token '+token;
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'put_customer/'),
      headers: <String, String>{
        'Authorization':finalToken,
      },
      body:
  ) ;
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> getCustomer(String token,String userPhone) async{
  String finalToken = 'Token '+token;
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'get_customer/'),
      headers: <String, String>{
        'Authorization':finalToken,
      },
      body:
  ) ;
  if (response.statusCode == 200) {
    // fromJson(json.decode(response.body));

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
