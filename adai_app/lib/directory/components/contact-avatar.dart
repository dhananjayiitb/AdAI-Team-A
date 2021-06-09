import 'package:adai/globals.dart';
import 'package:flutter/material.dart';

import '../contact-class.dart';

class ContactAvatar extends StatelessWidget {
  ContactAvatar(this.contact, this.size);
  final AppContact contact;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: button),
        child: (contact.info.avatar != null && contact.info.avatar.length > 0)
            ? CircleAvatar(
          backgroundImage: MemoryImage(contact.info.avatar),
        )
            : CircleAvatar(
            child: Text(contact.info.initials(),
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent));
  }
}