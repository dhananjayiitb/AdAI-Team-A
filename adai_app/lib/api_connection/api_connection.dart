import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adai/model/api_model.dart';

import '../globals.dart';

Future<Token> getToken(UserLogin userLogin) async {
  //print(_tokenURL);
  print(Uri.http('13.233.224.41:8000', 'core/verify/'));
  var response = await http.post (
    Uri.http('13.233.224.41:8000', 'core/verify/'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  print(response.body);
  if (response.statusCode == 200) {
    Token t = Token.fromJson(json.decode(response.body));
    token = t.token;
    return t;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List> getPosters() async {
  print(Uri.http('13.233.224.41:8000', 'core/get_posters/'));
  String finalToken = 'Token '+ token;
  print(finalToken);
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/get_posters/'),
    headers: <String, String>{
      'Authorization': finalToken,
    },
  );
  if (response.statusCode == 200) {
    var body = json.decode(response.body);
    List posters = [];
    for(int i = 0; i<body.length; i = i + 1){
      posters.add(base64Decode(body[i].toString()));
    }
    return posters;
    //return [base64Decode(json.decode(response.body)[0].toString())];
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List> getUserDetails() async {
  print(Uri.http('13.233.224.41:8000', 'core/get_user_details/'));
  String finalToken = 'Token '+ token;
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/get_user_details/'),
    headers: <String, String>{
      'Authorization': finalToken,
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    var num = response.body.length;
    List l1=[];
    print(num);
    return l1;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List> putUserDetails() async {
  print(Uri.http('13.233.224.41:8000', 'core/put_user_details/'));
  String finalToken = 'Token '+ token;
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/put_user_details/'),
    headers: <String, String>{
      'Authorization': finalToken,
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    var num = response.body.length;
    List l1 = [];
    print(num);
    return l1;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List> updateUserDetails() async {
  print(Uri.http('13.233.224.41:8000', 'core/update_user_details/'));
  String finalToken = 'Token '+ token;
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/update_user_details/'),
    headers: <String, String>{
      'Authorization': finalToken,
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    var num = response.body.length;
    List l1=[];
    print(num);
    return l1;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> getCustomer() async{
  String finalToken = 'Token '+ token;
  String body = '{"phone":"$phoneNum"}';
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/get_customer/'),
    headers: <String, String>{
      'Authorization': finalToken,
      'Content-Type': 'application/json',
    },
    body: body,
  ) ;
  if (response.statusCode == 200) {
    final parsed = json.decode(json.decode(response.body));
    userContacts = parsed;
    return parsed;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<void> putCustomer(String name, String contact) async{
  String finalToken = 'Token ' + token;
  print(finalToken);
  String body = '{"phone":"$phoneNum","name":"$name","contact":"$contact"}';
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/put_customer/'),
    headers: <String, String>{
      'Authorization': finalToken,
      'Content-Type': 'application/json',
    },
    body: body,
  ) ;
  print(response.statusCode);
  if (response.statusCode == 200) {
    print('customer data updated');
    await getCustomer();
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}