import 'package:adai/globals.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'components/contacts-list.dart';
import 'contact-class.dart';

class DirectoryHome extends StatefulWidget {
  const DirectoryHome({key}) : super(key: key);

  @override
  _DirectoryHomeState createState() => _DirectoryHomeState();
}

class _DirectoryHomeState extends State<DirectoryHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: ThemeData(
        canvasColor: background,
      ),
      home: DirectoryHomePage(title: 'Contacts'),
    );
  }
}

class DirectoryHomePage extends StatefulWidget {
  DirectoryHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DirectoryHomePageState createState() => _DirectoryHomePageState();
}

class _DirectoryHomePageState extends State<DirectoryHomePage> {
  List<AppContact> contacts = [];
  List<AppContact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();
  bool contactsLoaded = false;

  @override
  void initState() {
    super.initState();
    getPermissions();
  }
  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
      searchController.addListener(() {
        filterContacts();
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [
      button,
    ];
    int colorIndex = 0;
    List<AppContact> _contacts = (await ContactsService.getContacts()).map((contact) {
      Color baseColor = colors[colorIndex];
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
      return new AppContact(info: contact, color: baseColor);
    }).toList();
    setState(() {
      contacts = _contacts;
      contactsLoaded = true;
    });
  }

  filterContacts() {
    List<AppContact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.info.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.info.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemsExist = (
        (isSearching == true && contactsFiltered.length > 0) ||
            (isSearching != true && contacts.length > 0)
    );
    return Scaffold(
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

        onPressed: () async {
          try {
            Contact contact = await ContactsService.openContactForm();
            if(contact != null){
              getAllContacts();
            }
          } on FormOperationException catch (e) {}
        },
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
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
            contactsLoaded == true ?  // if the contacts have not been loaded yet
            listItemsExist == true ?  // if we have contacts to show
            ContactsList(
              reloadContacts: (){
                getAllContacts();
              },
              contacts: isSearching == true ? contactsFiltered : contacts,
            ) : Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  isSearching ?'No search results to show' : 'No contacts exist',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )
            ) :
            Container(  // still loading contacts
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}