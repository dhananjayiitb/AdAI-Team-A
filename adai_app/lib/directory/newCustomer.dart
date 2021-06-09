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
      appBar: AppBar(
        backgroundColor: background,
        title: Text("New Customer"),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              //TODO putCustomer()
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
            child: Icon(Icons.save, color: button,),
            style: ElevatedButton.styleFrom(primary: background,elevation: 0.0),
          ),
        ],
      ),
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
