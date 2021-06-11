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

Future<void> putUserDetails(String fname, String business, String businessNumber, String businessAddress, String businessType) async{
  print('entered putUser');
  print(token);
  print(phoneNum);
  String finalToken = 'Token '+token;
  String body = '{"phone":"$phoneNum","bname":"$business","fname":"$fname","b_type":"$businessType","b_phone":"$businessNumber","b_addr":"$businessAddress"}';
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/put_user_details/'),
    headers: <String, String>{
      'Authorization':finalToken,
    },
    body:body,
  ) ;
  print(response.statusCode);
  if (response.statusCode == 200) {
    print('User details updated');
  }
  else {
    print('error in putUSer');
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> getUserDetails() async{
  print(phoneNum);
  String finalToken = 'Token '+token;
  String body = '{"phone":"$phoneNum"}';
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/get_user_details/'),
    headers: <String, String>{
      'Authorization':finalToken,
    },
    body:body,
  ) ;
  print(response.statusCode);
  if (response.statusCode == 200) {
    var parsed = json.decode(json.decode(response.body));
    print(parsed[0]['fields']);
    return parsed[0]['fields'];
  }

  else {
      print('entered else');
    // if(json.decode(response.body).toString()=="User does not exist"){
      await putUserDetails( 'No Name', 'No Business Name', 'No Business Number', 'No business address', 'No business Type');
      print('user now exists');
      return await getUserDetails();
    //}
    // ignore: unnecessary_statements
    // else(
    //     throw Exception(json.decode(response.body))
    //     );
  }
}

Future<void> updateUserDetails( String fname, String business, String businessNumber, String businessAddress, String businessType) async{
  String finalToken = 'Token '+token;
  String body = '{"phone":"$phoneNum","bname":"$business","fname":"$fname","b_type":"$businessType","b_phone":"$businessNumber","b_addr":"$businessAddress"}';
  var response = await http.post(
    Uri.http('13.233.224.41:8000', 'core/update_user_details/'),
    headers: <String, String>{
      'Authorization':finalToken,
    },
    body:body,
  ) ;
  if (response.statusCode == 200) {
    print('user updated!');

  }
  else {
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