import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adai/model/api_model.dart';

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
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<List> getPosters(String token) async {
  print(Uri.http('13.233.224.41:8000', 'core/get_posters/'));
  String finalToken = 'Token '+ token;
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

Future<List> getUserDetails(String token) async {
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

Future<List> putUserDetails(String token) async {
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

Future<List> updateUserDetails(String token) async {
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

Future<List> getCustomer(String token) async {
  print(Uri.http('13.233.224.41:8000', 'core/get_customer/'));
  String finalToken = 'Token '+ token;
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/get_customer/'),
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

Future<List> putCustomer(String token) async {
  print(Uri.http('13.233.224.41:8000', 'core/put_customer/'));
  String finalToken = 'Token '+ token;
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/put_customer/'),
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