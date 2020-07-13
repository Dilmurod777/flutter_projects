import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/chat/chat_element/chat_element.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final List<User> contacts;

  const Chat({Key key, this.contacts}) : super(key: key);


  sortedChart() {
    final unreadContacts = [];
    final readContacts = [];

    contacts.forEach((contact) {
      if (contact.history.where((m) => !m.isRead).length > 0) {
        unreadContacts.add(contact);
      } else {
        readContacts.add(contact);
      }
    });


    // sort by number of unread messages
    unreadContacts.sort((a, b) {
      final unreadCountA = a.history.where((m) => !m.isRead).length;
      final unreadCountB = b.history.where((m) => !m.isRead).length;
      return unreadCountB - unreadCountA;
    });

    // sort by the last unread message time
    unreadContacts.sort((a, b) {
      final lastMessageTimeA = a.history.last.time;
      final lastMessageTimeB = b.history.last.time;

      return lastMessageTimeB.difference(lastMessageTimeA).inSeconds;
    });

    return [...unreadContacts, ...readContacts];
  }

  @override
  Widget build(BuildContext context) {
    final chatElements = sortedChart().map((user) => ChatElement(user: user));

    return Expanded(
      child: ListView(
        children: <Widget>[...chatElements],
      ),
    );
  }
}
