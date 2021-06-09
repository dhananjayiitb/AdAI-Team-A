import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

// Future<List> getTemplates(String token) async{
//   String finalToken = 'Token '+token;
//   var response = await http.post(
//     Uri.http('13.233.224.41:8000', 'core/get_posters/'),
//     headers: <String, String>{
//       'Authorization':finalToken,
//     },
//   );
//   if (response.statusCode == 200) {
//     // fromJson(json.decode(response.body));
//     print(response.body);
//     var imgArr = json.decode(response.body);
//     var num=imgArr.length;
//     List<dynamic> imageList =[];
//     int i;
//     for(i=0;i<num;i++){
//       Uint8List bytes = base64.decode(imgArr[i]);
//       imageList.add(bytes);
//     }
//     print(imageList);
//     return imageList;
//   }
//   else {
//     print(json.decode(response.body).toString());
//     throw Exception(json.decode(response.body));
//   }
// }

Future<void> putUserDetails(String token,String phone, String fname, String business, String businessNumber, String businessAddress, String businessType) async{
  print(token);
  String finalToken = 'Token '+token;
  String body = '{"phone":"$phone","bname":"$business","fname":"$fname","b_type":"$businessType","b_phone":"$businessNumber","b_addr":"$businessAddress"}';
 var response = await http.post(
   Uri.http('13.233.224.41:8000', 'core/put_user_details/'),
   headers: <String, String>{
     'Authorization':finalToken,
   },
   body:body,
 ) ;

  if (response.statusCode == 200) {
    print('User details updated');
  }
  else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> getUserDetails(String token,String phoneNumber) async{
  String finalToken = 'Token '+token;
  String body = '{"phone":"$phoneNumber"}';
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'core/get_user_details/'),
      headers: <String, String>{
        'Authorization':finalToken,
      },
      body:body,
  ) ;
  print(response.body);
  if (response.statusCode == 200) {
    var parsed = json.decode(json.decode(response.body));
    print(parsed[0]['fields']);
    return parsed[0]['fields'];
  }
  else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<void> updateUserDetails(String token,String phone, String fname, String business, String businessNumber, String businessAddress, String businessType) async{
  String finalToken = 'Token '+token;
  String body = '{"phone":"$phone","bname":"$business","fname":"$fname","b_type":"$businessType","b_phone":"$businessNumber","b_addr":"$businessAddress"}';
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

Future<void> putCustomer(String token,String userPhone,String name,String contact) async{
  String finalToken = 'Token '+token;
  String body = '{"phone":"$userPhone","name":"$name","contact":"$contact"}';
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'core/put_customer/'),
      headers: <String, String>{
        'Authorization':finalToken,
        'Content-Type':'application/json',
      },
      body: body,
  ) ;

  if (response.statusCode == 200) {
    print('customer data updated');

  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> getCustomer(String token,String userPhone) async{
  String finalToken = 'Token '+token;
  String body = '{"phone":"$userPhone"}';
  var response = await http.post(
      Uri.http('13.233.224.41:8000', 'core/get_customer/'),
      headers: <String, String>{
        'Authorization':finalToken,
        'Content-Type':'application/json',
      },
      body:body,
  ) ;
  if (response.statusCode == 200) {
    final parsed = json.decode(json.decode(response.body));
    return parsed;
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
