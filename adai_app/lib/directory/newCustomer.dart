import 'package:adai/api_connection/api_connection.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({Key key}) : super(key: key);

  @override
  _NewCustomerState createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text("New Customer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Contact Name',
                      icon: Icon(Icons.perm_identity, color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: button,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: button,
                        ),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.white
                    ),
                    //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    controller: _name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      icon: Icon(Icons.phone, color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: button,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: button,
                        ),
                      ),
                    ),
                    style: TextStyle(
                        color: Colors.white
                    ),
                    //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    controller: _phone,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
              Container(
                width:
                MediaQuery.of(context).size.width * 0.35,
                height:
                MediaQuery.of(context).size.height * 0.10,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if(_name.text.toString().length == 0 || _phone.text.toString().length == 0) return ;
                      await putCustomer(_name.text.toString(), '+91' + _phone.text.toString());
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    },
                    icon: Icon(Icons.save),
                    label: Text(
                      'Save',
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
    );
  }
}
