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
      // await getTemplates(token);
      // await putCustomer(token, '8427751533', 'GS', '9876543210');
      // await getCustomer(token, '8427751533');
      await putUserDetails(token, '8427751533', 'GS', 'business', 'businessNumber', 'businessAddress', 'businessType');
      await getUserDetails(token, '8427751533');

  }
}
