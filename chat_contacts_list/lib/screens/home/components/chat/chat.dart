import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/chat/chat_element/chat_element.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final List<User> contacts;
  final ScrollController scrollController;
  final bool showScrollEffect;

  const Chat({
    Key key,
    this.contacts,
    this.scrollController,
    this.showScrollEffect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(top: 15),
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: contacts.length,
        itemBuilder: (context, index) => ChatElement(user: contacts[index]),
      ),
    );
  }
}
