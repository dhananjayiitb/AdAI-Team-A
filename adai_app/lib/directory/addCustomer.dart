import 'package:adai/api_connection/api_connection.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../globals.dart';
import 'contact-class.dart';
import 'newCustomer.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  List<dynamic> _phoneContacts;
  TextEditingController searchController = new TextEditingController();
  bool contactsLoaded;

  getAllContacts() async {
    if (await Permission.contacts.request().isGranted) {
      List<AppContact> _contacts = (await ContactsService.getContacts()).map((
          contact) {
        return new AppContact(info: contact);
      }).toList();
      setState(() {
        phoneContacts = _contacts;
        _phoneContacts = phoneContacts;
        print(_phoneContacts);
        contactsLoaded = true;
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  filterContacts() {
    _phoneContacts = [];
    _phoneContacts.addAll(phoneContacts);
    if (searchController.text.isNotEmpty) {
      _phoneContacts.retainWhere((contact) {

        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.info.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);

        String phoneFlattened = flattenPhoneNumber(contact.info.phones.elementAt(0).value);
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        bool phoneMatches = phoneFlattened.contains(searchTermFlatten);

        if (nameMatches) return true;
        if (searchTermFlatten.isEmpty) return false;
        if (phoneMatches) return true;
        return false;
      });
    }
    setState(() {});
  }

  @override
  // ignore: must_call_super
  void initState() {
    contactsLoaded = false;
    searchController.addListener(() {
      filterContacts();
    });
    getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: searchController,
                  decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                          color: button,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: button,
                      )
                  ),
                ),
              ),
            ),
            !contactsLoaded
                ? Center(child: Text('Loading Contacts...', style: TextStyle(color: Colors.white, fontSize: 20),))
                : ListView.builder(
                  itemCount: _phoneContacts.length,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return ListTile(
                      onTap: () async{
                        await putCustomer(_phoneContacts[index].info.displayName, '+91' + _phoneContacts[index].info.phones.elementAt(0).value);
                        Navigator.of(context).pop();
                      },
                      title: Text(_phoneContacts[index].info.displayName, style: TextStyle(color: Colors.white),),
                      subtitle: Text(_phoneContacts[index].info.phones.elementAt(0).value, style: TextStyle(color: Colors.white),),
                      leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: button),
                          child: CircleAvatar(
                              child: Text(_phoneContacts[index].info.displayName[0], style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.transparent)
                      ),
                    );
                  },
            ),
          ],
        ),
      ),
    );
  }
}
