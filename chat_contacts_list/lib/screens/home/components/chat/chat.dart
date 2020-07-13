import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/chat/chat_element/chat_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final List<User> contacts;
  final ScrollController scrollController;
  final Function scrollUpEffect;
  final bool showScrollEffect;

  const Chat({
    Key key,
    this.contacts,
    this.scrollController,
    this.scrollUpEffect,
    this.showScrollEffect,
  }) : super(key: key);

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
      child: NotificationListener<ScrollNotification>(
        // ignore: missing_return
        onNotification: (scrollNotification) {
          if (showScrollEffect) {
            if (scrollNotification is OverscrollNotification) {
              if (scrollNotification.overscroll < 0) {
                scrollUpEffect();
              }
            }
          }
        },
        child: ListView(
          controller: scrollController,
          padding: EdgeInsets.only(top: 15),
          children: <Widget>[...chatElements],
        ),
      ),
    );
  }
}
