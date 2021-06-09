import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:adai/get_api_data/getting_Data.dart';
import 'package:adai/globals.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    getAllData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[900],
        body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 80.0,
          ),
        )
    );
  }

  void getAllData() async {
      //await getTemplates(token);
      //await putCustomer(token, phoneNum, 'GS_2', '+919999999990');
      //await getCustomer(token, phoneNum);
      //await updateUserDetails(token, phoneNum, 'Gs_update', 'business2', 'businessNumber2', 'businessAddress2', 'businessType2');
      //await putUserDetails(token, '+919876543210', 'GS', 'business', 'businessNumber', 'businessAddress', 'businessType');
      await getUserDetails(token, '+919876543210');

  }
}
