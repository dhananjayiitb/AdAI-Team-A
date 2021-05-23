import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adai/repository/user_repository.dart';

import 'package:adai/bloc/authentication_bloc.dart';
import 'package:adai/login/bloc/login_bloc.dart';
import 'package:adai/login/login_form_otp.dart';

class LoginOtp extends StatelessWidget {
  final UserRepository userRepository;
  final String phoneno;
  LoginOtp({Key key, @required this.userRepository, this.phoneno})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print(phoneno);
    return new WillPopScope(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 52, 68, 94),
        appBar: AppBar(
            title: Text('Enter OTP'),
            backgroundColor: Color.fromARGB(255, 17, 182, 202),
            leading: GestureDetector(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
              },
              child: Icon(
                Icons.arrow_back,
              ),
            )),
        body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: LoginFormotp(this.phoneno),
        ),
      ),
      onWillPop: () async {
        BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
        return false;
      },
    );
  }
}
