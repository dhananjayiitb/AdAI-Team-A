import 'package:adai/api_connection/api_connection.dart';
import 'package:adai/directory/addCustomer.dart';
import 'package:adai/globals.dart';
import 'package:flutter/material.dart';

class DirectoryHome extends StatefulWidget {
  const DirectoryHome({key}) : super(key: key);

  @override
  _DirectoryHomeState createState() => _DirectoryHomeState();
}

class _DirectoryHomeState extends State<DirectoryHome> {

  List<dynamic> _userContacts;
  TextEditingController searchController = new TextEditingController();
  bool contactsLoaded;

  getUserContacts() async{
    await getCustomer();
    setState(() {
      searchController.addListener(() {
        filterContacts();
      });
        _userContacts = userContacts;
        contactsLoaded = true;
      });
    }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  filterContacts() {
    _userContacts = [];
    _userContacts.addAll(userContacts);
    if (searchController.text.isNotEmpty) {
      _userContacts.retainWhere((contact) {

        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact[0].toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);

        String phoneFlattened = flattenPhoneNumber(contact[1]);
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
  void initState() {
    super.initState();
    contactsLoaded = false;
    getUserContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Directory", style: TextStyle(fontSize: 27),),
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: background,
        elevation: 20,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: button,
        onPressed: () async{
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCustomer(),
            ),
          );
          setState(() {
            _userContacts = userContacts;
          });
        },
      ),
      body: !contactsLoaded
          ? Center(child: CircularProgressIndicator())
          // ignore: null_aware_in_condition
          : userContacts?.isEmpty
          ? Center(child: Text('No Contacts Added', style: TextStyle(color: Colors.white, fontSize: 20),))
          : SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
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
                    !contactsLoaded
                        ? Center(child: CircularProgressIndicator())
                        : _userContacts == null || _userContacts.isEmpty
                            ? Center(
                                child: Container(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                                child: Text('No Contacts to Display',
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _userContacts.length,
                                itemBuilder: (context, index){
                                  return ListTile(
                                    onTap: () {},
                                    title: Text(_userContacts[index][0], style: TextStyle(color: Colors.white),),
                                    subtitle: Text(_userContacts[index][1], style: TextStyle(color: Colors.white),),
                                    leading: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: button),
                                      child: CircleAvatar(
                                        child: Text(_userContacts[index][0][0], style: TextStyle(color: Colors.white)),
                                        backgroundColor: Colors.transparent)
                                    ),
                                  );
                                },
                    )
                  ],
                ),
              ),
          ),
    );
  }
}