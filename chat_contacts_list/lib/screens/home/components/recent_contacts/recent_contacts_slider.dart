import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/my_profile.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/recent_contact_item.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class RecentContactsSlider extends StatelessWidget {
  final List<User> contacts;
  final User myProfile;

  const RecentContactsSlider({Key key, this.contacts, this.myProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentContactsList =
        contacts.map((user) => RecentContactItem(user: user));

    return Padding(
      padding: EdgeInsets.only(left: kHPadding),
      child: Container(
        height: 120,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[MyProfile(user: myProfile), ...recentContactsList],
        ),
      ),
    );
  }
}
