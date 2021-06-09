import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import 'contact-class.dart';
import 'newCustomer.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController searchController = new TextEditingController();
  List<AppContact> contacts = [];

  getAllContacts() async {
    List<AppContact> _contacts = (await ContactsService.getContacts()).map((contact) {
      return new AppContact(info: contact);
    }).toList();
    setState(() {
      contacts = _contacts;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewCustomer()),
          );
        },
        label: Text("Add New Customer"),
        icon: Icon(Icons.add),
        backgroundColor: button,
      ),
      appBar: AppBar(
        backgroundColor: background,
        title: Text("Select Contact"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    labelText: 'Search',
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                          color: button,
                        )
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: button,
                    )
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: contacts.length,
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index){
              return ListTile(
                onTap: () {
                  //TODO putCustomer()
                  Navigator.of(context).pop();
                },
                title: Text(contacts[index].info.displayName, style: TextStyle(color: Colors.white),),
                subtitle: Text(contacts[index].info.phones.elementAt(0).value, style: TextStyle(color: Colors.white),),
                leading: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: button),
                    child: CircleAvatar(
                        child: Text(contacts[index].info.displayName[0], style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.transparent)
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
