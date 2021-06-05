import 'package:adai/directory/pages/contact-details.dart';
import 'package:flutter/material.dart';

import '../contact-class.dart';
import 'contact-avatar.dart';

class ContactsList extends StatelessWidget {
  final List<AppContact> contacts;
  final Function() reloadContacts;

  ContactsList({Key key, this.contacts, this.reloadContacts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          AppContact contact = contacts[index];


          return ListTile(

              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ContactDetails(
                      contact,
                      onContactDelete: (AppContact _contact){
                        reloadContacts();
                        Navigator.of(context).pop();

                      },
                      onContactUpdate: (AppContact _contact){
                        reloadContacts();

                      },

                    )
                )
                );
              },
              title: Text(contact.info.displayName, style: TextStyle(color: Colors.white),),
              subtitle: Text(
                contact.info.phones.length > 0 ? contact.info.phones.elementAt(0).value : '',
                style: TextStyle(color: Colors.white),
              ),
              leading: ContactAvatar(contact, 36)

          );
        },
      ),
    );
  }
}