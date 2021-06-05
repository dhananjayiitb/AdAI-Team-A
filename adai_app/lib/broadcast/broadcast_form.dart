import 'dart:io';
import 'package:adai/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'share.dart';

class BroadcastForm extends StatefulWidget {
  final File preview = null;
  //BroadcastForm({this.preview});

  @override
  State<BroadcastForm> createState() => _BroadcastFormState();
}

class _BroadcastFormState extends State<BroadcastForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: background,
          //primarySwatch: Colors.red,
          //brightness: Brightness.dark,
        ),
        home: Scaffold(
            body: Container(
                child: Form(
                    child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: Image.asset('assets/images/test.png', fit: BoxFit.fill,),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.30,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Title',
                                        labelStyle: TextStyle(color: Colors.white),
                                        icon: Icon(Icons.title_outlined, color: Colors.white,),
                                      ),
                                      controller: _usernameController,
                                    ),
                                    TextFormField(
                                      minLines: 1,
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                        labelText: 'Description',
                                        labelStyle: TextStyle(color: Colors.white),
                                        icon: Icon(Icons.description, color: Colors.white,),
                                      ),
                                      controller: _passwordController,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Price',
                                        labelStyle: TextStyle(color: Colors.white),
                                        icon: Icon(Icons.money, color: Colors.white,),
                                      ),
                                      controller: _priceController,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.55,
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SharePage()),
                                      );
                                    },
                                    child: Text(
                                      'Create Poster',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: button,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                      side: BorderSide(
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                ),
            ),
        ),
    );
  }
}
