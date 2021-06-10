import 'package:adai/api_connection/api_connection.dart';

import '../globals.dart';

getUserData() async {
  var userDetails;
  userDetails = await getUserDetails(token,phoneNum);
  print(userDetails);

  fullName = userDetails['full_name']==null ? ' ':userDetails['full_name'];
  businessName = userDetails['business_name']==null ? 'empty ':userDetails['business_name'];
  businessAddress = userDetails['business_address']==null ? ' ':userDetails['business_address'];
  businessNumber = userDetails['business_phone']==null ? ' ':userDetails['business_phone'];
  businessType = userDetails['business_type']==null ? ' ':userDetails['business_type'];
  print('get data called');
  print(businessName);
}